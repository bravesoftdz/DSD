unit Member_ObjectToEdit;

interface

uses
  Winapi.Windows, DataModul, AncestorEditDialog, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxPCdxBarPopupMenu, cxContainer,
  cxEdit, cxCheckBox, cxCurrencyEdit, cxLabel, cxTextEdit, cxPC, Vcl.Controls,
  dsdDB, dsdAction, System.Classes, Vcl.ActnList, cxPropertiesStore, dsdAddOn,
  Vcl.StdCtrls, cxButtons, cxMemo, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dsdGuides, cxMaskEdit, cxButtonEdit;

type
  TMember_ObjectToEditForm = class(TAncestorEditDialogForm)
    edMeasureName: TcxTextEdit;
    cxLabel1: TcxLabel;
    ���: TcxLabel;
    ceCode: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    ceINN: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    ceDriverCertificate: TcxTextEdit;
    ceComment: TcxTextEdit;
    cbOfficial: TcxCheckBox;
    cxPageControl1: TcxPageControl;
    tsCommon: TcxTabSheet;
    tsContact: TcxTabSheet;
    cxLabel5: TcxLabel;
    edEmail: TcxTextEdit;
    spInsertUpdateContact: TdsdStoredProc;
    spGetMemberContact: TdsdStoredProc;
    cxLabel6: TcxLabel;
    EMailSign: TcxMemo;
    cxLabel7: TcxLabel;
    ceInfoMoney: TcxButtonEdit;
    InfoMoneyGuides: TdsdGuides;
    cxLabel8: TcxLabel;
    ceCard: TcxTextEdit;
    cxLabel9: TcxLabel;
    edPersonal: TcxButtonEdit;
    PersonalGuides: TdsdGuides;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}
initialization
  RegisterClass(TMember_ObjectToEditForm);
end.
