unit GlobVarsUnit;
interface
uses DB,ADODB,Vcl.Graphics;
Const
 BaseKey : PChar = '\SOFTWARE\GalaktikaPlus\CMKProject';
 lf=#13#10;
 Abracadabra = 'sdgsdgsudagiseeo959toiehg';
 DefaultStyle='Slate Classico';
 dot='.';
 space=' ';
 comma=',';
 zero='0';
 dotdot=':';
 dotcomma=';';
 truu='1=1';
 falsee='1=0';
 andd=' and ';
 orr=' or ';
 tire='-';
 buk=['а'..'€','ј'..'я','a'..'z','A'..'Z'];
 cif=['0'..'9'];
 kav='''';
 quote='"';
 EmptyNREC='8000000000000000';
// DelpiUserLogin='sys_DelphiUser';
// DelpiUserPassword='qazaq';
 StartInterfaceText='запуск интерфейса';
 SelectThemeText='выбор цветовой схемы';
 DelpiUserLogin='Tools';
 DelpiUserPassword='valien';

 INIMainSection='Main';

 MonthArray:array[0..11] of string =
  ('€нварь',
   'февраль',
   'март',
   'апрель',
   'май',
   'июнь',
   'июль',
   'август',
   'сент€брь',
   'окт€брь',
   'но€брь',
   'декабрь');
 MonthArray2:array[0..11] of string =
  ('€нвар€',
   'феврал€',
   'марта',
   'апрел€',
   'ма€',
   'июн€',
   'июл€',
   'августа',
   'сент€бр€',
   'окт€бр€',
   'но€бр€',
   'декабр€');


  ThumbW = 100;
  ThumbH = 70;

 CmkContractor = 1;

 EqEsabNrec=1528262966;
 EqMesser1Nrec=1676438627;
 EqMesser2Nrec=1783125030;
 EqCincinaNrec=1124028123;
 EqPelsNrec=1970900395;
 EqZonntagNrec=1481166591;
 EqPilaol222Nrec=1649868787;
 EqPnevmopressNrec=6;

 SchemaName='CMKNEW';
 MachinesTable='Equipment';
 SitesTable='Sites';
 PersonTable='Workers';
 ProfTable='Prof';
 ShopsTable='Contractors';
 JournalTable='Journal';
 UserGroupTable='UserGroups';
 UsersTable='Persons';
 PlansTable='Plans';
 SpPlansTable='SpPlans';
 MarksTable='Marks';
 KdTable='Kd';
 DMarksTable='DMarks';
 DetailsTable='Details';
 AktsTable='Acts';
 SpAktsTable='SpActs';

var
  GlobADOC:TAdoConnection;
  IniFile,MainDir,ProgName,TempDir,MainVers,MainVersF,PicturesDir,LastUserLogin,ReportsDir:string;
  orcl:string;
  ReportsDirectToExcel,ShowDemandInfo:boolean;
  OraConString:string;
  LoggedIn:boolean;
  MainBgColor: TColor;
  DebugMode:boolean;
  ActiveStyle:string;
  FlagClose:string;

implementation

end.
