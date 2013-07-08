program DSDTest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  dbCreateStructureTest in '..\SOURCE\dbCreateStructureTest.pas',
  dbMetadataTest in '..\SOURCE\dbMetadataTest.pas',
  dbProcedureTest in '..\SOURCE\dbProcedureTest.pas',
  dbEnumTest in '..\SOURCE\dbEnumTest.pas',
  AuthenticationTest in '..\SOURCE\AuthenticationTest.pas',
  dbObjectTest in '..\SOURCE\dbObjectTest.pas',
  dbMovementTest in '..\SOURCE\dbMovementTest.pas',
  LoadFormTest in '..\SOURCE\LoadFormTest.pas',
  Forms,
  DataModul in '..\..\SOURCE\DataModul.pas' {dmMain: TDataModule},
  Authentication in '..\..\SOURCE\Authentication.pas',
  Storage in '..\..\SOURCE\Storage.pas',
  zLibUtil in '..\SOURCE\zLibUtil.pas',
  UtilConst in '..\..\SOURCE\UtilConst.pas',
  UtilConvert in '..\..\SOURCE\UtilConvert.pas',
  CommonData in '..\..\SOURCE\CommonData.pas',
  dsdGuides in '..\..\SOURCE\COMPONENT\dsdGuides.pas',
  FormStorage in '..\..\SOURCE\FormStorage.pas',
  GoodsKindEdit in '..\..\Forms\GoodsKindEdit.pas' {GoodsKindEditForm},
  GoodsPropertyEdit in '..\..\Forms\GoodsPropertyEdit.pas' {GoodsPropertyEditForm},
  GoodsProperty in '..\..\Forms\GoodsProperty.pas' {GoodsPropertyForm},
  CurrencyEdit in '..\..\Forms\CurrencyEdit.pas' {CurencyEditForm},
  GoodsGroupEdit in '..\..\Forms\GoodsGroupEdit.pas' {GoodsGroupEditForm},
  PriceListEdit in '..\..\Forms\PriceListEdit.pas' {PriceListEditForm},
  PriceList in '..\..\Forms\PriceList.pas' {PriceListForm},
  ParentForm in '..\..\SOURCE\ParentForm.pas' {ParentForm},
  dsdAction in '..\..\SOURCE\COMPONENT\dsdAction.pas',
  GoodsKind in '..\..\Forms\GoodsKind.pas' {GoodsKindForm},
  Bank in '..\..\Forms\Bank.pas' {CurrencyForm},
  GoodsGroup in '..\..\Forms\GoodsGroup.pas' {GoodsGroupForm},
  JuridicalGroupEdit in '..\..\Forms\JuridicalGroupEdit.pas' {JuridicalGroupEditForm},
  JuridicalGroup in '..\..\Forms\JuridicalGroup.pas' {JuridicalGroupForm},
  PartnerEdit in '..\..\Forms\PartnerEdit.pas' {PartnerEditForm},
  GoodsEdit in '..\..\Forms\GoodsEdit.pas' {GoodsEditForm},
  UnitGroupEdit in '..\..\Forms\UnitGroupEdit.pas' {UnitGroupEditForm},
  UnitGroup in '..\..\Forms\UnitGroup.pas' {UnitGroupForm},
  Goods in '..\..\Forms\Goods.pas' {GoodsForm},
  UnitEdit in '..\..\Forms\UnitEdit.pas' {UnitEditForm},
  MeasureEdit in '..\..\Forms\MeasureEdit.pas' {MeasureEditForm},
  PaidKind in '..\..\Forms\PaidKind.pas' {PaidKindForm},
  Partner in '..\..\Forms\Partner.pas' {PartnerForm},
  CashEdit in '..\..\Forms\CashEdit.pas' {CashEditForm},
  Cash in '..\..\Forms\Cash.pas' {CashForm},
  Currency in '..\..\Forms\Currency.pas' {CurrencyForm},
  BankEdit in '..\..\Forms\BankEdit.pas' {BankEditForm},
  BranchEdit in '..\..\Forms\BranchEdit.pas' {BranchEditForm},
  Branch in '..\..\Forms\Branch.pas' {BranchForm},
  Measure in '..\..\Forms\Measure.pas' {MeasureForm},
  GoodsPropertyValue in '..\..\Forms\GoodsPropertyValue.pas' {GoodsPropertyValueForm},
  ContractKindEdit in '..\..\Forms\ContractKindEdit.pas' {ContractKindEditForm},
  ContractKind in '..\..\Forms\ContractKind.pas' {ContractKindForm},
  GoodsPropertyValueEdit in '..\..\Forms\GoodsPropertyValueEdit.pas' {GoodsPropertyValueEditForm},
  BankAccount in '..\..\Forms\BankAccount.pas' {BankAccountForm},
  BankAccountEdit in '..\..\Forms\BankAccountEdit.pas' {BankAccountEditForm},
  BusinessEdit in '..\..\Forms\BusinessEdit.pas' {BusinessEditForm},
  Business in '..\..\Forms\Business.pas' {BusinessForm},
  JuridicalEdit in '..\..\Forms\JuridicalEdit.pas' {JuridicalEditForm},
  Juridical in '..\..\Forms\Juridical.pas' {JuridicalForm},
  dsdDB in '..\..\SOURCE\COMPONENT\dsdDB.pas',
  Units in '..\..\Forms\Units.pas' {UnitForm},
  dbMovementItemTest in '..\SOURCE\dbMovementItemTest.pas',
  Income in '..\..\Forms\Income.pas' {IncomeForm},
  IncomeJournal in '..\..\Forms\IncomeJournal.pas' {ParentForm2},
  dsdAddOn in '..\..\SOURCE\COMPONENT\dsdAddOn.pas',
  dbMovementCompleteTest in '..\SOURCE\dbMovementCompleteTest.pas',
  Balance in '..\..\Forms\Report\Balance.pas' {ParentForm1},
  LoadReportTest in '..\SOURCE\LoadReportTest.pas',
  dbObjectHistoryTest in '..\SOURCE\dbObjectHistoryTest.pas',
  InfoMoneyGroup in '..\..\Forms\InfoMoneyGroup.pas' {InfoMoneyGroupForm},
  InfoMoneyGroupEdit in '..\..\Forms\InfoMoneyGroupEdit.pas' {InfoMoneyGroupEditForm},
  InfoMoneyDestination in '..\..\Forms\InfoMoneyDestination.pas' {InfoMoneyDestinationForm},
  InfoMoneyDestinationEdit in '..\..\Forms\InfoMoneyDestinationEdit.pas' {InfoMoneyDestinationEditForm},
  InfoMoney in '..\..\Forms\InfoMoney.pas' {InfoMoneyForm},
  InfoMoneyEdit in '..\..\Forms\InfoMoneyEdit.pas' {InfoMoneyEditForm},
  AccountGroup in '..\..\Forms\AccountGroup.pas' {AccountGroupForm},
  AccountGroupEdit in '..\..\Forms\AccountGroupEdit.pas' {AccountGroupEditForm},
  AccountDirection in '..\..\Forms\AccountDirection.pas' {AccountDirectionForm},
  AccountDirectionEdit in '..\..\Forms\AccountDirectionEdit.pas' {AccountDirectionEditForm},
  ProfitLossGroup in '..\..\Forms\ProfitLossGroup.pas' {ProfitLossGroupForm},
  ProfitLossGroupEdit in '..\..\Forms\ProfitLossGroupEdit.pas' {ProfitLossGroupEditForm},
  Account in '..\..\Forms\Account.pas' {AccountForm},
  AccountEdit in '..\..\Forms\AccountEdit.pas' {AccountEditForm},
  ProfitLoss in '..\..\Forms\ProfitLoss.pas' {ProfitLossForm},
  ProfitLossDirection in '..\..\Forms\ProfitLossDirection.pas' {ProfitLossDirectionForm},
  ProfitLossDirectionEdit in '..\..\Forms\ProfitLossDirectionEdit.pas' {ProfitLossDirectionEditForm},
  ProfitLossEdit in '..\..\Forms\ProfitLossEdit.pas' {ProfitLossEditForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
  DUnitTestRunner.RunRegisteredTests;
end.

