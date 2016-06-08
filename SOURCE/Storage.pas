unit Storage;

interface

uses SysUtils;

type

  ///	<summary>
  /// ��������� - ���� ����� ����������� � ������� �������.
  ///	</summary>
  ///	<remarks>
  /// ������������ ������ ��������� ��� ������ ������� �� ������� ���� ������
  ///	</remarks>
  IStorage = interface
    function GetConnection: string;
    ///	<summary>
    /// ��������� ������ ����������� XML �������� �� ������� ������.
    ///	</summary>
    ///	<remarks>
    /// ���������� XML ��� ��������� ������
    ///	</remarks>
    ///	<param name="pData">
    ///	  XML ���������, �������� ������ ��� ��������� �� �������
    ///	</param>
    ///	<param name="pExecOnServer">
    ///	  ���� true, �� ��������� ����������� � ����� �� ������� ������
    ///	</param>
    function ExecuteProc(pData: String; pExecOnServer: boolean = false;
      AMaxAtempt: Byte = 10; ANeedShowException: Boolean = True): Variant;
    property Connection: String read GetConnection;
  end;

  TStorageFactory = class
     class function GetStorage: IStorage;
  end;

  EStorageException = class(Exception)
  private
    FErrorCode: string;
  public
    constructor Create(AMessage: String; AErrorCode: String = '');
    property ErrorCode: string read FErrorCode write FErrorCode;
  end;

  function ConvertXMLParamToStrings(XMLParam: String): String;

implementation

uses IdHTTP, Xml.XMLDoc, XMLIntf, Classes, ZLibEx, idGlobal, UtilConst, Variants,
     UtilConvert, MessagesUnit, Dialogs, StrUtils, IDComponent, SimpleGauge,
     Forms, Log, IdStack, IdExceptionCore, SyncObjS, CommonData;

const

   ResultTypeLenght = 13;
   IsArchiveLenght = 2;
   XMLStructureLenghtLenght = 10;

type

  TStorage = class(TInterfacedObject, IStorage)
  strict private
    class var
      Instance: TStorage;
  private
    FConnection: String;
    FConnections: TStringList;
    FActiveConnection: Integer;
    IdHTTP: TIdHTTP;
    FSendList: TStringList;
    FReceiveStream: TStringStream;
    Str: AnsiString;//RawByteString;
    XMLDocument: IXMLDocument;
    isArchive: boolean;
    // ���������� ������ ����� ��-�� �������
    FCriticalSection: TCriticalSection;
    function PrepareStr: AnsiString;
    function ExecuteProc(pData: String; pExecOnServer: boolean = false;
      AMaxAtempt: Byte = 10; ANeedShowException: Boolean = True): Variant;
    procedure ProcessErrorCode(pData: String; ProcedureParam: String);
    function ProcessMultiDataSet: Variant;
    function GetConnection: string;
  public
    property Connection: String read GetConnection;
    class function NewInstance: TObject; override;
  end;

  TIdHTTPWork = class
    FExecOnServer: boolean;
    Gauge: IGauge;
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
  end;

  var
    IdHTTPWork: TIdHTTPWork;

function TStorage.GetConnection: string;
begin
  result := FConnection;
end;

class function TStorage.NewInstance: TObject;
var
  StringList: TStringList;
  ConnectionString: string;
  i: Integer;
  StartPHP: Boolean;
begin
  if not Assigned(Instance) then begin
    Instance := TStorage(inherited NewInstance);
    Instance.FConnections := TStringList.Create;
    Instance.FActiveConnection := 0;
    try
      StringList := TStringList.Create;
      try
        StringList.LoadFromFile(ConnectionPath);
        //����������� ������ ��������� �������������� ��������
        StartPHP := False;
        for i := 0 to StringList.Count-1 do
        Begin
          if not StartPHP AND (pos('<?php',StringList.Strings[i]) = 1) then
            StartPHP := True
          else
          if StartPHP AND (pos('?>',StringList.Strings[i]) = 1) then
            StartPHP := False
          else
          Begin
            if StartPHP AND (pos('$host',StringList.Strings[i])>0) then
            Begin
              ConnectionString := Copy(StringList.Strings[i],pos('$host',StringList.Strings[i])+5,maxInt);
              delete(ConnectionString,1,pos('"',ConnectionString));
              ConnectionString := Copy(ConnectionString,1,pos('"',ConnectionString)-1);
              Instance.FConnections.Add(trim(ConnectionString));
            End
            else
            if not StartPHP then
            Begin
              Instance.FConnections.Add(trim(StringList.Strings[i]));
            end;
          End;
        End;
        if Instance.FConnections.Count = 0 then
          Instance.FConnections.Add('http://localhost/dsd/index.php');
        ConnectionString := Instance.FConnections.Strings[0];
        (*
        if StringList.Count = 1 then
           ConnectionString := StringList[0]
        else begin
           // �������� ������ �����������
           ConnectionString := StringList[2];
           ConnectionString := Copy(ConnectionString, Pos('=', ConnectionString) + 3, maxint);
           ConnectionString := Copy(ConnectionString, 1, length(ConnectionString) - 2);
        end;*)
      finally
        StringList.Free;
      end;
    except
      if Instance.FConnections.Count = 0 then
        Instance.FConnections.Add('http://localhost/dsd/index.php');
      ConnectionString := Instance.FConnections.Strings[0];
      //ConnectionString := 'http://localhost/dsd/index.php';
    end;
    Instance.FConnection := ConnectionString;
    Instance.IdHTTP := TIdHTTP.Create(nil);
    Instance.IdHTTP.ConnectTimeout := 5000;
    Instance.IdHTTP.Response.CharSet := 'windows-1251';// 'Content-Type: text/xml; charset=utf-8'
    with Instance.IdHTTP.Request do
    begin
      Connection:='keep-alive';
    end;
    Instance.IdHTTP.OnWorkBegin := IdHTTPWork.IdHTTPWorkBegin;
    Instance.IdHTTP.OnWork := IdHTTPWork.IdHTTPWork;
    Instance.FSendList := TStringList.Create;
    Instance.FReceiveStream := TStringStream.Create('');
    Instance.XMLDocument := TXMLDocument.Create(nil);
    Instance.FCriticalSection := TCriticalSection.Create;
  end;
  NewInstance := Instance;
end;

procedure TIdHTTPWork.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  if not FExecOnServer then
     exit;
  if AWorkMode = wmRead then
     Gauge.IncProgress(1);
end;

procedure TIdHTTPWork.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  if not FExecOnServer then
     exit;
  if AWorkMode = wmWrite then begin
     TIdHTTP(ASender).IOHandler.RecvBufferSize := 1;
     Gauge := TGaugeFactory.GetGauge('���������� ��������� �� �������', 1, 100);
     Gauge.Start;
  end;
end;

function TStorage.PrepareStr: AnsiString;
begin
  if isArchive then
     result := ZDecompressStr(Str)
  else
     result := Str
end;

procedure TStorage.ProcessErrorCode(pData: String; ProcedureParam: String);
begin
  with LoadXMLData(pData).DocumentElement do
    if NodeName = gcError then
       raise EStorageException.Create(StringReplace(GetAttribute(gcErrorMessage), '������:  ', '', []) + ' context: ' + ProcedureParam, GetAttribute(gcErrorCode));
end;

function TStorage.ProcessMultiDataSet: Variant;
var
  XMLStructureLenght: integer;
  DataFromServer: String;
  i, StartPosition: integer;
begin
  DataFromServer := PrepareStr;
  // ��� ���������� ��������� ��������� ����� �������.
  // � ������ ���� �������� XML, ��� �������� ������ �� ���������.

  XMLStructureLenght := StrToInt(Copy(DataFromServer, 1, XMLStructureLenghtLenght));
  XMLDocument.LoadFromXML(Copy(DataFromServer, XMLStructureLenghtLenght + 1, XMLStructureLenght));
  with XMLDocument.DocumentElement do begin
    result := VarArrayCreate([0, ChildNodes.Count - 1], varVariant);
    // �������� ��������� �� ������ ���-�� ����, ��� �� �� ���������� ������
    StartPosition := XMLStructureLenghtLenght + 1 + XMLStructureLenght;
    for I := 0 to ChildNodes.Count - 1 do begin
      XMLStructureLenght := StrToInt(ChildNodes[i].GetAttribute('length'));
      result[i] := Copy(DataFromServer, StartPosition,  XMLStructureLenght);
      StartPosition := StartPosition + XMLStructureLenght;
    end;
  end;
end;

function PrepareValue(Value, DataType: string): string;
begin
  if (DataType = 'ftBlob') or (DataType = 'ftString') or (DataType = 'ftBoolean') then
     result := chr(39) + Value + chr(39);
  if (DataType = 'ftFloat') or (DataType = 'ftInteger') then
     result := Value;
  if (DataType = 'ftDateTime') then
     result := '(' + chr(39) + Value + chr(39) + ')::TDateTime';
end;

function ConvertXMLParamToStrings(XMLParam: String): String;
var i: integer;
    Session: String;
begin
  result := '';
  with LoadXMLData(XMLParam).DocumentElement do begin
     Session := GetAttribute('Session');
     with ChildNodes.First do begin
       result := 'select * from ' + NodeName + '(';
       for I := 0 to ChildNodes.Count - 1 do
         with ChildNodes[i] do begin
           result := result + NodeName + ' := ' + PrepareValue(GetAttribute('Value'), GetAttribute('DataType')) + ' , ';
         end;
       result := result + ' inSession := ' + chr(39) + Session + chr(39) + ');';
     end;
  end;
end;

function TStorage.ExecuteProc(pData: String; pExecOnServer: boolean = false;
  AMaxAtempt: Byte = 10; ANeedShowException: Boolean = True): Variant;
  function GetAddConnectString(pExecOnServer: boolean): String;
  begin
    if pExecOnServer then
       result := 'server.php'
    else
       result := '';
  end;
var
  ResultType: String;
  AttemptCount: integer;
  ok: Boolean;
  StartActiveConnection: Integer;
  LastError: integer;
  function NextActiveConnection: Integer;
  Begin
    Result := (FActiveConnection+1) mod FConnections.Count;
  End;
  function LastAttempt: Boolean;
  Begin
    Result := (AttemptCount >= AMaxAtempt) AND (NextActiveConnection = StartActiveConnection);
  End;
  function Midle: Boolean;
  Begin
    Result := (AttemptCount = (AMaxAtempt div 2));
  End;
begin
  FCriticalSection.Enter;
  try
    if gc_isDebugMode then
       TMessagesForm.Create(nil).Execute(ConvertXMLParamToStrings(pData), ConvertXMLParamToStrings(pData), true);
    FSendList.Clear;
    FSendList.Add('XML=' + '<?xml version="1.1" encoding="windows-1251"?>' + pData);
    Logger.AddToLog(pData);
    FReceiveStream.Clear;
    IdHTTPWork.FExecOnServer := pExecOnServer;
    AttemptCount := 0;
    ok := False;
    StartActiveConnection := FActiveConnection;
    try
      repeat
        for AttemptCount := 1 to AMaxAtempt do
        Begin
          try
            idHTTP.Post(FConnection + GetAddConnectString(pExecOnServer), FSendList, FReceiveStream, TIdTextEncoding.GetEncoding(1251));
            ok := true;
            break;
          except
            on E: EIdSocketError do
            Begin
              if LastAttempt then
              Begin
                if ANeedShowException then
                Begin
                  if gc_allowLocalConnection AND not gc_User.Local then
                  Begin
                    gc_User.Local := True;
                    //ShowMessage('��������� ���������� � ����� ���������� ������.'+#13+
                    //            '����������� � ��������� ����� �������������� ����� � ��������.')
                  end;
                  case E.LastError of
                    10051: raise EStorageException.Create('���������� ����������� � ����. ���������� � ���������� ��������������. context TStorage. ' + E.Message, );
                    10054: raise EStorageException.Create('���������� �������� ��������. ���������� �������� ��� ���. context TStorage. ' + E.Message);
                    10060: raise EStorageException.Create('��� ������� � �������. ���������� � ���������� ��������������. context TStorage. ' + E.Message);
                    11001: raise EStorageException.Create('��� ������� � �������. ���������� � ���������� ��������������. context TStorage. ' + E.Message);
                    10065: raise EStorageException.Create('��� ���������� � ����������. ���������� � ���������� ��������������. context TStorage. ' + E.Message);
                    10061: raise EStorageException.Create('�������� ���������� � WEB ��������. ���������� ��������� � ��������� ����� �������������� ����������.');
                  else
                    raise E;
                  end;
                End;
              End
              else
              Begin
                if Midle then
                  idHTTP.Disconnect;
                Sleep(1000);
              End;
            End;
            on E: Exception do
            Begin
              if LastAttempt then
              Begin
                if ANeedShowException then
                Begin
                  if gc_allowLocalConnection AND not gc_User.Local then
                  Begin
                    gc_User.Local := True;
                    //ShowMessage('��������� ���������� � ����� ���������� ������.'+#13+
                    //            '����������� � ��������� ����� �������������� ����� � ��������.')
                  end;
                  raise Exception.Create('������ ���������� � Web ��������.'+#10+#13+'���������� � ������������.'+#10+#13+E.Message);
                End;
              End
              else
              Begin
                if Midle then
                  idHTTP.Disconnect;
                Sleep(1000);
              End;
            End;
          end;
        End;
        if not Ok AND Not LastAttempt then
        Begin
          FActiveConnection := NextActiveConnection;
          FConnection := FConnections.Strings[FActiveConnection];
          try
            idHTTP.Disconnect;
          except
          end;
        end
        else
          Break;
      until ok;
      (*
      for AttemptCount := 1 to 10 do
        try
          idHTTP.Post(FConnection + GetAddConnectString(pExecOnServer), FSendList, FReceiveStream, TIdTextEncoding.GetEncoding(1251));
          break;
        except
          on E: EIdSocketError do begin
             case E.LastError of
               10051: raise EStorageException.Create('���������� ����������� � ����. ���������� � ���������� ��������������. context TStorage. ' + E.Message, );
               10054: raise EStorageException.Create('���������� �������� ��������. ���������� �������� ��� ���. context TStorage. ' + E.Message);
               10060: begin
                         if AttemptCount > 9 then
                            raise EStorageException.Create('��� ������� � �������. ���������� � ���������� ��������������. context TStorage. ' + E.Message);
                      end;
               11001: raise EStorageException.Create('��� ������� � �������. ���������� � ���������� ��������������. context TStorage. ' + E.Message);
               10065: raise EStorageException.Create('��� ���������� � ����������. ���������� � ���������� ��������������. context TStorage. ' + E.Message);
               10061: raise EStorageException.Create('�������� ���������� � WEB ��������. ���������� ��������� � ��������� ����� �������������� ����������.');
               else
                      raise E;
             end;
          end;
          on E: Exception do
                raise Exception.Create('������ ���������� � Web ��������.'+#10+#13+'���������� � ������������.'+#10+#13+E.Message);
        end;
      *)
    finally
      if IdHTTPWork.FExecOnServer then
         IdHTTPWork.Gauge.Finish;
      IdHTTPWork.FExecOnServer := false;
   //   idHTTP.Disconnect;
    end;
  //  if pExecOnServer then

    // ���������� ��� ������������� ����������
    if Ok then
    Begin
      ResultType := trim(Copy(FReceiveStream.DataString, 1, ResultTypeLenght));
      isArchive := trim(lowercase(Copy(FReceiveStream.DataString, ResultTypeLenght + 1, IsArchiveLenght))) = 't';
      Str := Copy(FReceiveStream.DataString, ResultTypeLenght + IsArchiveLenght + 1, maxint);
      if ResultType = gcMultiDataSet then begin
         Result := ProcessMultiDataSet;
         exit;
      end;
      if ResultType = gcError then
         ProcessErrorCode(PrepareStr, ConvertXMLParamToStrings(pData));
      if ResultType = gcResult then
         Result := PrepareStr;
      if ResultType = gcDataSet then
         Result := PrepareStr;

      Logger.AddToLog(Result);
    End;
  finally
    // ����� �� ����������� ������
    FCriticalSection.Leave;
  end;
end;

class function TStorageFactory.GetStorage: IStorage;
begin
  result := TStorage(TStorage.NewInstance);
end;

{ EStorageException }

constructor EStorageException.Create(AMessage: String; AErrorCode: String = '');
begin
  inherited Create(AMessage);
  ErrorCode := AErrorCode;
end;

initialization
  IdHTTPWork := TIdHTTPWork.Create;

end.
