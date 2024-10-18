MODULE Module1
    VAR egmident egmID1;
    CONST pose pose0:=[[0,0,0],[1,0,0,0]];
    PERS dnum DnumInData{40};
    PERS dnum DnumOutData{40};
    
    VAR dnum count:=0;
    
    PROC main()
        EGMGetId egmID1;
        EGMSetupUC ROB_1,egmID1,"default","UCdevice"\Pose;
        EGMActPose egmID1\StreamStart\Tool:=tool0\WObj:=wobj0\DataToSensor:=DnumOutData,\DataFromSensor:=DnumInData,pose0,EGM_FRAME_WOBJ,pose0,EGM_FRAME_WOBJ;
        WHILE count<1000 DO
            Incr count;
            DnumOutData:=[count,count,count,count,count,count,count,count,count,count,
                          count,count,count,count,count,count,count,count,count,count,
                          count,count,count,count,count,count,count,count,count,count,
                          count,count,count,count,count,count,count,count,count,count];
            MoveAbsJ [[0,0,0,0,30,0],[9E9,9E9,9E9,9E9,9E9,9E9]]\NoEOffs,v1000,fine,tool0\WObj:=wobj0;
            MoveAbsJ [[90,0,0,0,30,0],[9E9,9E9,9E9,9E9,9E9,9E9]]\NoEOffs,v1000,fine,tool0\WObj:=wobj0;
        ENDWHILE
        EGMStop egmID1,EGM_STOP_HOLD;
        !
    ENDPROC
ENDMODULE