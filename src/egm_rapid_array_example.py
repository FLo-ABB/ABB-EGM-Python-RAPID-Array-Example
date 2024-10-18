from abb_robot_client.egm import EGM
import random
import numpy as np


def main() -> None:
    """
    Main function to establish communication with an ABB robot using the EGM (Externally Guided Motion) interface.

    This function continuously receives data from the robot and sends random RAPID data back.
    The loop breaks only on a timeout of 0.5 seconds.

    - Receives an array from the robot using `egm.receive_from_robot()`.
    - Sends a randomly generated array of integers between 0 and 100 to the robot using `egm.send_to_robot()`.
    """

    egm = EGM()

    while True:
        # Receive data from the robot with a 0.5-second timeout
        res: bool
        state: object
        res, state = egm.receive_from_robot(timeout=0.5)

        if res:
            # Extract the array received from the robot
            array_from_robot: np.ndarray = state.rapid_from_robot
            print(array_from_robot)

            # Generate a random array to send to the robot
            array_to_robot: np.ndarray = np.array([random.randint(0, 100) for _ in range(40)])

            # Send data back to the robot
            egm.send_to_robot(joint_angles=None, rapid_to_robot=array_to_robot)


if __name__ == "__main__":
    main()
