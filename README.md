# ABB Robot EGM RAPID Array Communication

This project demonstrates communication between an ABB robot and a Python-based controller using the Externally Guided Motion (EGM) interface. It involves continuously receiving RAPID arrays from the robot and sending back randomly generated RAPID arrays. It works with  RobotWare 6.X and RobotWare 7.X.

## Project Structure

- **`egm_rapid_array_example.py`**: A Python script that establishes communication with the ABB robot via the `abb_robot_client.egm` library. It uses EGM to exchange data arrays between the robot and the controlling program.
  
  - The script continuously receives an array of data from the robot using `egm.receive_from_robot()`.
  - It then generates a random array of integers between 0 and 100 and sends it back to the robot using `egm.send_to_robot()`.

- **`Module1.mod`**: A RAPID module that should be loaded onto the ABB robot. It defines the program logic to enable communication with the Python script via EGM.

## Requirements

- **Python 3.8+**
- **Libraries**: 
  - `abb_robot_client`: Used for handling EGM communication with the ABB robot. Install using:
    ```bash
    pip install abb-robot-client
    ```

## Usage

1. Ensure the RAPID module (`Module1.mod`) is loaded onto the robot.
2. Run the Python script to start communication:
   ```bash
   python egm_rapid_array_example.py
   ```

3. The program will receive data from the robot and send back random data arrays in a continuous loop until a timeout occurs.

## External Libraries

- [abb_robot_client](https://github.com/rpiRobotics/abb_robot_client): This library is used for interacting with ABB robots through the EGM interface, enabling Python-based control of robot movements and data exchange.

## License

This project is licensed under the MIT License.
