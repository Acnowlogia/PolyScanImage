function [methodinfo,structs,enuminfo,ThunkLibName]=AlazarInclude
%ALAZARINCLUDE Create structures to define interfaces found in 'AlazarApi'.

%This function was generated by loadlibrary.m parser version 1.1.6.29 on Wed Jan 30 15:36:43 2013
%perl options:'AlazarApi.i -outfile=AlazarInclude.m -thunkfile=ATSApi_thunk_pcwin64.c'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival,'thunkname', ival);
MfilePath=fileparts(mfilename('fullpath'));
ThunkLibName=fullfile(MfilePath,'ATSApi_thunk_pcwin64');
% unsigned int AlazarGetOEMFPGAName ( int opcodeID , char * FullPath , unsigned long * error ); 
fcns.thunkname{fcnNum}='uint32int32cstringvoidPtrThunk';fcns.name{fcnNum}='AlazarGetOEMFPGAName'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'int32', 'cstring', 'ulongPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarOEMSetWorkingDirectory ( char * wDir , unsigned long * error ); 
fcns.thunkname{fcnNum}='uint32cstringvoidPtrThunk';fcns.name{fcnNum}='AlazarOEMSetWorkingDirectory'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'cstring', 'ulongPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarOEMGetWorkingDirectory ( char * wDir , unsigned long * error ); 
fcns.thunkname{fcnNum}='uint32cstringvoidPtrThunk';fcns.name{fcnNum}='AlazarOEMGetWorkingDirectory'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'cstring', 'ulongPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarParseFPGAName ( const char * FullName , char * Name , unsigned int * Type , unsigned int * MemSize , unsigned int * MajVer , unsigned int * MinVer , unsigned int * MajRev , unsigned int * MinRev , unsigned int * error ); 
fcns.thunkname{fcnNum}='uint32cstringcstringvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarParseFPGAName'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'cstring', 'cstring', 'uint32Ptr', 'uint32Ptr', 'uint32Ptr', 'uint32Ptr', 'uint32Ptr', 'uint32Ptr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarOEMDownLoadFPGA ( void * h , char * FileName , unsigned int * RetValue ); 
fcns.thunkname{fcnNum}='uint32voidPtrcstringvoidPtrThunk';fcns.name{fcnNum}='AlazarOEMDownLoadFPGA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'cstring', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarDownLoadFPGA ( void * h , char * FileName , unsigned int * RetValue ); 
fcns.thunkname{fcnNum}='uint32voidPtrcstringvoidPtrThunk';fcns.name{fcnNum}='AlazarDownLoadFPGA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'cstring', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarReadWriteTest ( void * h , unsigned int * Buffer , unsigned int SizeToWrite , unsigned int SizeToRead ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarReadWriteTest'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarMemoryTest ( void * h , unsigned int * errors ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarMemoryTest'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarBusyFlag ( void * h , int * BusyFlag ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarBusyFlag'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'int32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarTriggeredFlag ( void * h , int * TriggeredFlag ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarTriggeredFlag'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'int32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarBoardsFound (); 
fcns.thunkname{fcnNum}='uint32Thunk';fcns.name{fcnNum}='AlazarBoardsFound'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% void * AlazarOpen ( char * BoardNameID ); 
fcns.thunkname{fcnNum}='voidPtrcstringThunk';fcns.name{fcnNum}='AlazarOpen'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='voidPtr'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% void AlazarClose ( void * h ); 
fcns.thunkname{fcnNum}='voidvoidPtrThunk';fcns.name{fcnNum}='AlazarClose'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}=[]; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% MSILS AlazarGetBoardKind ( void * h ); 
fcns.thunkname{fcnNum}='MSILSvoidPtrThunk';fcns.name{fcnNum}='AlazarGetBoardKind'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='MSILS'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetCPLDVersion ( void * h , unsigned char * Major , unsigned char * Minor ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetCPLDVersion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetChannelInfo ( void * h , unsigned int * MemSize , unsigned char * SampleSize ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetChannelInfo'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetSDKVersion ( unsigned char * Major , unsigned char * Minor , unsigned char * Revision ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetSDKVersion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'uint8Ptr', 'uint8Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetDriverVersion ( unsigned char * Major , unsigned char * Minor , unsigned char * Revision ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetDriverVersion'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'uint8Ptr', 'uint8Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarInputControl ( void * h , unsigned char Channel , unsigned int Coupling , unsigned int InputRange , unsigned int Impedance ); 
fcns.thunkname{fcnNum}='uint32voidPtruint8uint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarInputControl'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetPosition ( void * h , unsigned char Channel , int PMPercent , unsigned int InputRange ); 
fcns.thunkname{fcnNum}='uint32voidPtruint8int32uint32Thunk';fcns.name{fcnNum}='AlazarSetPosition'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8', 'int32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetExternalTrigger ( void * h , unsigned int Coupling , unsigned int Range ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarSetExternalTrigger'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetTriggerDelay ( void * h , unsigned int Delay ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarSetTriggerDelay'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetTriggerTimeOut ( void * h , unsigned int to_ns ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarSetTriggerTimeOut'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarTriggerTimedOut ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarTriggerTimedOut'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetTriggerAddress ( void * h , unsigned int Record , unsigned int * TriggerAddress , unsigned int * TimeStampHighPart , unsigned int * TimeStampLowPart ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32voidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetTriggerAddress'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr', 'uint32Ptr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarSetTriggerOperation ( void * h , unsigned int TriggerOperation , unsigned int TriggerEngine1 , unsigned int Source1 , unsigned int Slope1 , unsigned int Level1 , unsigned int TriggerEngine2 , unsigned int Source2 , unsigned int Slope2 , unsigned int Level2 ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint32uint32uint32uint32uint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarSetTriggerOperation'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetTriggerOperationForScanning ( void * h , unsigned int slope , unsigned int level , unsigned int options ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarSetTriggerOperationForScanning'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarAbortCapture ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarAbortCapture'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarForceTrigger ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarForceTrigger'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarForceTriggerEnable ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarForceTriggerEnable'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarStartCapture ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarStartCapture'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarCaptureMode ( void * h , unsigned int Mode ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarCaptureMode'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarStreamCapture ( void * h , void * Buffer , unsigned int BufferSize , unsigned int DeviceOption , unsigned int ChannelSelect , unsigned int * error ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32uint32uint32voidPtrThunk';fcns.name{fcnNum}='AlazarStreamCapture'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32', 'uint32', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarHyperDisp ( void * h , void * Buffer , unsigned int BufferSize , unsigned char * ViewBuffer , unsigned int ViewBufferSize , unsigned int NumOfPixels , unsigned int Option , unsigned int ChannelSelect , unsigned int Record , long TransferOffset , unsigned int * error ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32voidPtruint32uint32uint32uint32uint32longvoidPtrThunk';fcns.name{fcnNum}='AlazarHyperDisp'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32', 'uint8Ptr', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32', 'long', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarFastPRRCapture ( void * h , void * Buffer , unsigned int BufferSize , unsigned int DeviceOption , unsigned int ChannelSelect , unsigned int * error ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32uint32uint32voidPtrThunk';fcns.name{fcnNum}='AlazarFastPRRCapture'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32', 'uint32', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarBusy ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarBusy'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarTriggered ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarTriggered'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetStatus ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetStatus'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarDetectMultipleRecord ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarDetectMultipleRecord'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarSetRecordCount ( void * h , unsigned int Count ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarSetRecordCount'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetRecordSize ( void * h , unsigned int PreSize , unsigned int PostSize ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarSetRecordSize'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetCaptureClock ( void * h , unsigned int Source , unsigned int Rate , unsigned int Edge , unsigned int Decimation ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarSetCaptureClock'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetExternalClockLevel ( void * h , float percent ); 
fcns.thunkname{fcnNum}='uint32voidPtrfloatThunk';fcns.name{fcnNum}='AlazarSetExternalClockLevel'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'single'};fcnNum=fcnNum+1;
% unsigned int AlazarSetClockSwitchOver ( void * hBoard , unsigned int uMode , unsigned int uDummyClockOnTime_ns , unsigned int uReserved ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarSetClockSwitchOver'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarRead ( void * h , unsigned int Channel , void * Buffer , int ElementSize , long Record , long TransferOffset , unsigned int TransferLength ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32voidPtrint32longlonguint32Thunk';fcns.name{fcnNum}='AlazarRead'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'voidPtr', 'int32', 'long', 'long', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetParameter ( void * h , unsigned char Channel , unsigned int Parameter , long Value ); 
fcns.thunkname{fcnNum}='uint32voidPtruint8uint32longThunk';fcns.name{fcnNum}='AlazarSetParameter'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8', 'uint32', 'long'};fcnNum=fcnNum+1;
% unsigned int AlazarSetParameterUL ( void * h , unsigned char Channel , unsigned int Parameter , unsigned int Value ); 
fcns.thunkname{fcnNum}='uint32voidPtruint8uint32uint32Thunk';fcns.name{fcnNum}='AlazarSetParameterUL'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarGetParameter ( void * h , unsigned char Channel , unsigned int Parameter , long * RetValue ); 
fcns.thunkname{fcnNum}='uint32voidPtruint8uint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetParameter'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8', 'uint32', 'longPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetParameterUL ( void * h , unsigned char Channel , unsigned int Parameter , unsigned int * RetValue ); 
fcns.thunkname{fcnNum}='uint32voidPtruint8uint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetParameterUL'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% void * AlazarGetSystemHandle ( unsigned int sid ); 
fcns.thunkname{fcnNum}='voidPtruint32Thunk';fcns.name{fcnNum}='AlazarGetSystemHandle'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='voidPtr'; fcns.RHS{fcnNum}={'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarNumOfSystems (); 
fcns.thunkname{fcnNum}='uint32Thunk';fcns.name{fcnNum}='AlazarNumOfSystems'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% unsigned int AlazarBoardsInSystemBySystemID ( unsigned int sid ); 
fcns.thunkname{fcnNum}='uint32uint32Thunk';fcns.name{fcnNum}='AlazarBoardsInSystemBySystemID'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarBoardsInSystemByHandle ( void * systemHandle ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarBoardsInSystemByHandle'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% void * AlazarGetBoardBySystemID ( unsigned int sid , unsigned int brdNum ); 
fcns.thunkname{fcnNum}='voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarGetBoardBySystemID'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='voidPtr'; fcns.RHS{fcnNum}={'uint32', 'uint32'};fcnNum=fcnNum+1;
% void * AlazarGetBoardBySystemHandle ( void * systemHandle , unsigned int brdNum ); 
fcns.thunkname{fcnNum}='voidPtrvoidPtruint32Thunk';fcns.name{fcnNum}='AlazarGetBoardBySystemHandle'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='voidPtr'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetLED ( void * h , unsigned int state ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarSetLED'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarQueryCapability ( void * h , unsigned int request , unsigned int value , unsigned int * retValue ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32voidPtrThunk';fcns.name{fcnNum}='AlazarQueryCapability'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarMaxSglTransfer ( ALAZAR_BOARDTYPES bt ); 
fcns.thunkname{fcnNum}='uint32ALAZAR_BOARDTYPESThunk';fcns.name{fcnNum}='AlazarMaxSglTransfer'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'BoardTypes'};fcnNum=fcnNum+1;
% unsigned int AlazarGetMaxRecordsCapable ( void * h , unsigned int RecordLength , unsigned int * num ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetMaxRecordsCapable'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetWhoTriggeredBySystemHandle ( void * systemHandle , unsigned int brdNum , unsigned int recNum ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarGetWhoTriggeredBySystemHandle'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarGetWhoTriggeredBySystemID ( unsigned int sid , unsigned int brdNum , unsigned int recNum ); 
fcns.thunkname{fcnNum}='uint32uint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarGetWhoTriggeredBySystemID'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSetBWLimit ( void * h , unsigned int Channel , unsigned int enable ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarSetBWLimit'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarSleepDevice ( void * h , unsigned int state ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarSleepDevice'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarStartAutoDMA ( void * h , void * Buffer1 , unsigned int UseHeader , unsigned int ChannelSelect , long TransferOffset , unsigned int TransferLength , long RecordsPerBuffer , long RecordCount , int * error , unsigned int r1 , unsigned int r2 , unsigned int * r3 , unsigned int * r4 ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32uint32longuint32longlongvoidPtruint32uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarStartAutoDMA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32', 'uint32', 'long', 'uint32', 'long', 'long', 'int32Ptr', 'uint32', 'uint32', 'uint32Ptr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetNextAutoDMABuffer ( void * h , void * Buffer1 , void * Buffer2 , long * WhichOne , long * RecordsTransfered , int * error , unsigned int r1 , unsigned int r2 , long * TriggersOccurred , unsigned int * r4 ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtruint32uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetNextAutoDMABuffer'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'voidPtr', 'longPtr', 'longPtr', 'int32Ptr', 'uint32', 'uint32', 'longPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetNextBuffer ( void * h , void * Buffer1 , void * Buffer2 , long * WhichOne , long * RecordsTransfered , int * error , unsigned int r1 , unsigned int r2 , long * TriggersOccurred , unsigned int * r4 ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrvoidPtrvoidPtrvoidPtruint32uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetNextBuffer'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'voidPtr', 'longPtr', 'longPtr', 'int32Ptr', 'uint32', 'uint32', 'longPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarCloseAUTODma ( void * h ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarCloseAUTODma'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarAbortAutoDMA ( void * h , void * Buffer , int * error , unsigned int r1 , unsigned int r2 , unsigned int * r3 , unsigned int * r4 ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtruint32uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarAbortAutoDMA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'int32Ptr', 'uint32', 'uint32', 'uint32Ptr', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarGetAutoDMAHeaderValue ( void * h , unsigned int Channel , void * DataBuffer , unsigned int Record , unsigned int Parameter , int * error ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32voidPtruint32uint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetAutoDMAHeaderValue'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'voidPtr', 'uint32', 'uint32', 'int32Ptr'};fcnNum=fcnNum+1;
% float AlazarGetAutoDMAHeaderTimeStamp ( void * h , unsigned int Channel , void * DataBuffer , unsigned int Record , int * error ); 
fcns.thunkname{fcnNum}='floatvoidPtruint32voidPtruint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetAutoDMAHeaderTimeStamp'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='single'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'voidPtr', 'uint32', 'int32Ptr'};fcnNum=fcnNum+1;
% void * AlazarGetAutoDMAPtr ( void * h , unsigned int DataOrHeader , unsigned int Channel , void * DataBuffer , unsigned int Record , int * error ); 
fcns.thunkname{fcnNum}='voidPtrvoidPtruint32uint32voidPtruint32voidPtrThunk';fcns.name{fcnNum}='AlazarGetAutoDMAPtr'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='voidPtr'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'voidPtr', 'uint32', 'int32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarWaitForBufferReady ( void * h , long tms ); 
fcns.thunkname{fcnNum}='uint32voidPtrlongThunk';fcns.name{fcnNum}='AlazarWaitForBufferReady'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'long'};fcnNum=fcnNum+1;
% unsigned int AlazarEvents ( void * h , unsigned int enable ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarEvents'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarBeforeAsyncRead ( void * hBoard , unsigned int uChannelSelect , long lTransferOffset , unsigned int uSamplesPerRecord , unsigned int uRecordsPerBuffer , unsigned int uRecordsPerAcquisition , unsigned int uFlags ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32longuint32uint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarBeforeAsyncRead'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'long', 'uint32', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarAsyncRead ( void * hBoard , void * pBuffer , unsigned int BytesToRead , OVERLAPPED * pOverlapped ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32voidPtrThunk';fcns.name{fcnNum}='AlazarAsyncRead'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32', 'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarAbortAsyncRead ( void * hBoard ); 
fcns.thunkname{fcnNum}='uint32voidPtrThunk';fcns.name{fcnNum}='AlazarAbortAsyncRead'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarPostAsyncBuffer ( void * hDevice , void * pBuffer , unsigned int uBufferLength_bytes ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32Thunk';fcns.name{fcnNum}='AlazarPostAsyncBuffer'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarWaitAsyncBufferComplete ( void * hDevice , void * pBuffer , unsigned int uTimeout_ms ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32Thunk';fcns.name{fcnNum}='AlazarWaitAsyncBufferComplete'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarWaitNextAsyncBufferComplete ( void * hDevice , void * pBuffer , unsigned int uBufferLength_bytes , unsigned int uTimeout_ms ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarWaitNextAsyncBufferComplete'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarCreateStreamFileA ( void * hDevice , const char * pszFilePath ); 
fcns.thunkname{fcnNum}='uint32voidPtrcstringThunk';fcns.name{fcnNum}='AlazarCreateStreamFileA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'cstring'};fcnNum=fcnNum+1;
% unsigned int AlazarCreateStreamFileW ( void * hDevice , const WCHAR * pszFilePath ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarCreateStreamFileW'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint16Ptr'};fcnNum=fcnNum+1;
% long AlazarFlushAutoDMA ( void * h ); 
fcns.thunkname{fcnNum}='longvoidPtrThunk';fcns.name{fcnNum}='AlazarFlushAutoDMA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='long'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% void AlazarStopAutoDMA ( void * h ); 
fcns.thunkname{fcnNum}='voidvoidPtrThunk';fcns.name{fcnNum}='AlazarStopAutoDMA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}=[]; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
% unsigned int AlazarResetTimeStamp ( void * h , unsigned int resetFlag ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarResetTimeStamp'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarReadRegister ( void * hDevice , unsigned int offset , unsigned int * retVal , unsigned int pswrd ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32voidPtruint32Thunk';fcns.name{fcnNum}='AlazarReadRegister'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarWriteRegister ( void * hDevice , unsigned int offset , unsigned int Val , unsigned int pswrd ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarWriteRegister'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarDACSetting ( void * h , unsigned int SetGet , unsigned int OriginalOrModified , unsigned char Channel , unsigned int DACNAME , unsigned int Coupling , unsigned int InputRange , unsigned int Impedance , unsigned int * getVal , unsigned int setVal , unsigned int * error ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint8uint32uint32uint32uint32voidPtruint32voidPtrThunk';fcns.name{fcnNum}='AlazarDACSetting'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint8', 'uint32', 'uint32', 'uint32', 'uint32', 'uint32Ptr', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarConfigureAuxIO ( void * hDevice , unsigned int uMode , unsigned int uParameter ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarConfigureAuxIO'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% const char * AlazarErrorToText ( unsigned int code ); 
fcns.thunkname{fcnNum}='cstringuint32Thunk';fcns.name{fcnNum}='AlazarErrorToText'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarConfigureSampleSkipping ( void * hBoard , unsigned int uMode , unsigned int uSampleClocksPerRecord , unsigned short * pwClockSkipMask ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32voidPtrThunk';fcns.name{fcnNum}='AlazarConfigureSampleSkipping'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint16Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarCoprocessorRegisterRead ( void * hDevice , unsigned int offset , unsigned int * pValue ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32voidPtrThunk';fcns.name{fcnNum}='AlazarCoprocessorRegisterRead'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarCoprocessorRegisterWrite ( void * hDevice , unsigned int offset , unsigned int value ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32Thunk';fcns.name{fcnNum}='AlazarCoprocessorRegisterWrite'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarCoprocessorDownloadA ( void * hBoard , char * pszFileName , unsigned int uOptions ); 
fcns.thunkname{fcnNum}='uint32voidPtrcstringuint32Thunk';fcns.name{fcnNum}='AlazarCoprocessorDownloadA'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'cstring', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarCoprocessorDownloadW ( void * hBoard , WCHAR * pszFileName , unsigned int uOptions ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtruint32Thunk';fcns.name{fcnNum}='AlazarCoprocessorDownloadW'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint16Ptr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarGetBoardRevision ( void * hBoard , unsigned char * Major , unsigned char * Minor ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarGetBoardRevision'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
% unsigned int AlazarConfigureRecordAverage ( void * hBoard , unsigned int uMode , unsigned int uSamplesPerRecord , unsigned int uRecordsPerAverage , unsigned int uOptions ); 
fcns.thunkname{fcnNum}='uint32voidPtruint32uint32uint32uint32Thunk';fcns.name{fcnNum}='AlazarConfigureRecordAverage'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32', 'uint32', 'uint32'};fcnNum=fcnNum+1;
% unsigned char * AlazarAllocBufferU8 ( void * hBoard , unsigned int uSampleCount ); 
fcns.thunkname{fcnNum}='voidPtrvoidPtruint32Thunk';fcns.name{fcnNum}='AlazarAllocBufferU8'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint8Ptr'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarFreeBufferU8 ( void * hBoard , unsigned char * pBuffer ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarFreeBufferU8'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr'};fcnNum=fcnNum+1;
% unsigned short * AlazarAllocBufferU16 ( void * hBoard , unsigned int uSampleCount ); 
fcns.thunkname{fcnNum}='voidPtrvoidPtruint32Thunk';fcns.name{fcnNum}='AlazarAllocBufferU16'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint16Ptr'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
% unsigned int AlazarFreeBufferU16 ( void * hBoard , unsigned short * pBuffer ); 
fcns.thunkname{fcnNum}='uint32voidPtrvoidPtrThunk';fcns.name{fcnNum}='AlazarFreeBufferU16'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='uint32'; fcns.RHS{fcnNum}={'voidPtr', 'uint16Ptr'};fcnNum=fcnNum+1;
structs.s_BoardDef.members=struct('RecordCount', 'uint32', 'RecLength', 'uint32', 'PreDepth', 'uint32', 'ClockSource', 'uint32', 'ClockEdge', 'uint32', 'SampleRate', 'uint32', 'CouplingChanA', 'uint32', 'InputRangeChanA', 'uint32', 'InputImpedChanA', 'uint32', 'CouplingChanB', 'uint32', 'InputRangeChanB', 'uint32', 'InputImpedChanB', 'uint32', 'TriEngOperation', 'uint32', 'TriggerEngine1', 'uint32', 'TrigEngSource1', 'uint32', 'TrigEngSlope1', 'uint32', 'TrigEngLevel1', 'uint32', 'TriggerEngine2', 'uint32', 'TrigEngSource2', 'uint32', 'TrigEngSlope2', 'uint32', 'TrigEngLevel2', 'uint32');
structs.s_HEADER2.members=struct('TimeStampLowPart', 'uint32');
% structs.s_ALAZAR_HEADER.members=struct('hdr0', 'error', 'hdr1', 'error', 'hdr2', 's_HEADER2', 'hdr3', 'error');
enuminfo.BoardTypes=struct('ATS_NONE',0,'ATS850',1,'ATS310',2,'ATS330',3,'ATS855',4,'ATS315',5,'ATS335',6,'ATS460',7,'ATS860',8,'ATS660',9,'ATS665',10,'ATS9462',11,'ATS9434',12,'ATS9870',13,'ATS9350',14,'ATS9325',15,'ATS9440',16,'ATS9410',17,'ATS9351',18,'ATS9310',19,'ATS9461',20,'ATS9850',21,'ATS9625',22,'ATG6500',23,'ATS9626',24,'ATS9360',25,'ATS_LAST',26);
enuminfo.MSILS=struct('KINDEPENDENT',0,'KSLAVE',1,'KMASTER',2,'KLASTSLAVE',3);
methodinfo=fcns;