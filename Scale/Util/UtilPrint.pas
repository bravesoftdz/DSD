unit UtilPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dsdAction, Vcl.ActnList, dsdDB, Data.DB,
  Datasnap.DBClient;

type
  TUtilPrintForm = class(TForm)
    PrintItemsSverkaCDS: TClientDataSet;
    PrintItemsCDS: TClientDataSet;
    PrintHeaderCDS: TClientDataSet;
    spGetReporNameTax: TdsdStoredProc;
    spGetReportName: TdsdStoredProc;
    spGetReporNameBill: TdsdStoredProc;
    spSelectTax_Us: TdsdStoredProc;
    spSelectTax_Client: TdsdStoredProc;
    spSelectPrint_Sale: TdsdStoredProc;
    spSelectPrintInvoice: TdsdStoredProc;
    spSelectPrintTTN: TdsdStoredProc;
    spSelectPrintPack22: TdsdStoredProc;
    spSelectPrintPack21: TdsdStoredProc;
    spSelectPrintPack: TdsdStoredProc;
    FormParams: TdsdFormParams;
    ActionList: TActionList;
    mactPrint_Sale: TMultiAction;
    mactPrint_Bill: TMultiAction;
    mactPrint_Tax_Us: TMultiAction;
    mactPrint_Tax_Client: TMultiAction;
    actPrintTax_Us: TdsdPrintAction;
    actPrintTax_Client: TdsdPrintAction;
    actPrint: TdsdPrintAction;
    actPrint_Bill: TdsdPrintAction;
    actSPPrintSaleProcName: TdsdExecStoredProc;
    actSPPrintSaleTaxProcName: TdsdExecStoredProc;
    actSPPrintSaleBillProcName: TdsdExecStoredProc;
    actPrint_Spec: TdsdPrintAction;
    actPrint_Invoice: TdsdPrintAction;
    actPrint_Pack: TdsdPrintAction;
    actPrint_Pack22: TdsdPrintAction;
    actPrint_Pack21: TdsdPrintAction;
    actPrint_TTN: TdsdPrintAction;
    actPrint_ReturnIn: TdsdPrintAction;
    spSelectPrint_ReturnIn: TdsdStoredProc;
    spSelectPrint_SendOnPrice: TdsdStoredProc;
    actPrint_SendOnPrice: TdsdPrintAction;
  private
  end;

  procedure Print_Sale (MovementId: Integer);
  procedure Print_ReturnIn (MovementId: Integer);
  procedure Print_SendOnPrice (MovementId: Integer);

var
  UtilPrintForm: TUtilPrintForm;

implementation
{$R *.dfm}
//------------------------------------------------------------------------------------------------
procedure Print_Sale (MovementId: Integer);
begin
  UtilPrintForm.FormParams.ParamByName('Id').Value := MovementId;
  UtilPrintForm.mactPrint_Sale.Execute;
end;
//------------------------------------------------------------------------------------------------
procedure Print_ReturnIn (MovementId: Integer);
begin
  UtilPrintForm.FormParams.ParamByName('Id').Value := MovementId;
  UtilPrintForm.actPrint_ReturnIn.Execute;
end;
//------------------------------------------------------------------------------------------------
procedure Print_SendOnPrice (MovementId: Integer);
begin
  UtilPrintForm.FormParams.ParamByName('Id').Value := MovementId;
  UtilPrintForm.actPrint_SendOnPrice.Execute;
end;
//------------------------------------------------------------------------------------------------
end.
