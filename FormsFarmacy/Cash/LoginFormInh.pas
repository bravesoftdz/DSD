unit LoginFormInh;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LoginForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  cxPropertiesStore, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel, dsdDB, dxSkinsCore, dxSkinsDefaultPainters;

type
  TLoginForm1 = class(TLoginForm)
    cxLabel4: TcxLabel;
    edFarmacyName: TcxComboBox;
    spChekFarmacyName: TdsdStoredProc;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm1: TLoginForm1;

implementation

uses Storage, Authentication, CommonData, MessagesUnit, StrUtils, LocalWorkUnit,
  IniUtils, MainCash;

{$R *.dfm}

procedure TLoginForm1.btnOkClick(Sender: TObject);
begin
  inherited;
  // ��������� ��������������� ������ ��� ������� ������� + ��� ������ � MainForm
  IniUtils.gUnitName  := edFarmacyName.Text;
  IniUtils.gUserName  := edUserName.Text;
  IniUtils.gPassValue := edPassword.Text;

  if ModalResult <> mrOk then exit;

  spChekFarmacyName.ParamByName('inUnitName').Value := edFarmacyName.Text;
  try spChekFarmacyName.Execute;
    if spChekFarmacyName.ParamByName('outIsEnter').Value = FALSE
    then ModalResult := mrCancel
    else if edFarmacyName.Enabled then iniLocalUnitNameSave(edFarmacyName.Text);
  except ON E: Exception do
      Begin
         Application.OnException(Application.MainForm,E);
         ModalResult := mrNone;
      End;
  end;
end;

procedure TLoginForm1.FormShow(Sender: TObject);
begin
  inherited;
  ActiveControl:=edUserName;
  //
  edFarmacyName.Text := iniLocalUnitNameGet;
  if edFarmacyName.Text <> '' then
    edFarmacyName.Enabled := False // ���� ����������� ���� ���
  else
    ActiveControl:=edFarmacyName;
end;

end.
