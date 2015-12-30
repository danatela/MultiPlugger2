unit GlobVars;

interface
Uses Graphics, Classes, ADODB, frxClass, frxDBSet, MemTableEh, UPlugin;
Const
 SchemaName='CMKNEW.';
 GrMaterialsParents = '1,2,3,4,5,6,7,8,9,10,11,100,101';
 TrueGrMaterialsParents = [3,4,5,6,7,8,9,10,11,100,101];
 TrueGrMaterialsParents_ = '3,4,5,6,7,8,9,10,11,100,101';
 BaseKey : PChar = '\SOFTWARE\GalaktikaPlus\CMKProject';
 lf=#10#13;
JetDateTimeFmt='#yyyymmdd hh:nn:ss#';
JetDateFmt='\#mm\/dd\/yyyy\#;;;\N\u\l\l';
JetTimeFmt='\#hh\:nn\:ss\#;;;\N\u\l\l';
 MinDate='30.12.1899';
 MaxDate='01.01.2100';
 Debug=False;
 EmptyDate='.  .';
 kav='''';
 slash='/';
 truu='1=1';
 falsee='1=2';
 andd=' and ';
 orr=' or ';
 asc=' ASC';
 desc=' DESC';
 cif=['0'..'9'];
 bylo='БЫЛО:';
 stalo='СТАЛО:';
 latchars=['a'..'z','A'..'Z'];
 DateSeparators=['.','/','\','-'];
 buk=['а'..'я','А'..'Я','a'..'z','A'..'Z'];
 comma=',';
 quote='"';
 space=' ';
 dot='.';
 tab=#9;
 dotdot=':';
 dotcomma=';';
 zero='0';
 el='';
 tire='-';
 All_='[все]';
 ReportExt='.fr3';
 TxtExt='.txt';
 BackUpExt='.cab';
 allelements='<все>';
 nds_default=18;

 MonthArray:array[0..11] of string =
  ('январь',
   'февраль',
   'март',
   'апрель',
   'май',
   'июнь',
   'июль',
   'август',
   'сентябрь',
   'октябрь',
   'ноябрь',
   'декабрь');
 MonthArray2:array[0..11] of string =
  ('января',
   'февраля',
   'марта',
   'апреля',
   'мая',
   'июня',
   'июля',
   'августа',
   'сентября',
   'октября',
   'ноября',
   'декабря');
// OraConString='Provider=MSDAORA.1;Password=valien;User ID=alien;Data Source=ORCL';
 BaseExt='.mdb';

 PlatTable='Platejki';
 PlatOperTable='PlatOper';
 SchetTable='Schets';
 ReportsTable='Reports';
 NDSTable='nds';

 LogTable='Journal';

 LogStruct=
  'NREC COUNTER,'+
  'DATETIM DATE,'+
  'CUSER INTEGER,'+
  'CACTION INTEGER,'+
  'COMMENT MEMO,'+
  'PRIMARY KEY (NREC)';

 ReportsStruct=
  'nrec counter,'+
  'name varchar(250),'+
  'cFirm integer,'+
  'DocType integer,'+
  'sys_id integer default 0,'+
  'Comment varchar(250),'+
  'PRIMARY KEY (nrec)';

 PretenzTable='Pretenz';
 PretenzStruct=
  'nrec counter,'+
  'cKlient integer,'+
  'PretDate date default date(),'+
  'PretSut memo,'+
  'Predprin memo,'+
  'Operator integer,'+
  'PRIMARY KEY (nrec)';

 FirmsTable='Firms';
 FirmsStruct=
  'nrec counter,'+
  'name varchar(250),'+
  'inn varchar(12),'+
  'kpp varchar(9),'+
  'address varchar(250),'+
  'phones varchar(250),'+
  'Director integer,'+
  'GlavBuh integer,'+
  'Kassir integer,'+
  'Prefix varchar(10),'+
  'NextNom varchar(10),'+
  'Sufix varchar(10),'+
  'POSTDATE DATE default date(),'+ {Дата и время появления записи в базе}
  'PRIMARY KEY (nrec)';

  KlientTable='Clients';
  KlientStruct=
  'nrec counter,'+
//  'Node integer,'+
  'cFirm integer,'+
  'Firm varchar(250),'+
  'cGroup integer,'+
  'Name varchar(250),'+
  'NickName varchar(20),'+
  'Address varchar(250),'+
  'AddressF varchar(250),'+
  'AddrScht varchar(250),'+
  'Inn varchar(12),'+
  'Kpp varchar(9),'+
  'Phones varchar(250),'+
  'MinPlat money,'+
  'SrokPlat integer,'+   // Срок оплаты счета в днях
  'Closed bit,'+         // True - закрыт за неоплату
  'WasClosed bit,'+      // True - бывал закрыт за неоплату
  'Cash bit,'+           // True - нал, False - безнал
  'cCourier integer,'+   // ссылка на закрепленного курьера
  'DogDate DATE default date(),'+
  'DogNom varchar(30),'+
  'DogRastor bit,'+
  'Predopl money default 0,'+
  'POSTDATE DATE default date(),'+ {Дата и время появления записи в базе}
  'PRIMARY KEY (nrec)';

  GroupsTable='ClGroups';
  GroupsStruct=
  'nrec counter,'+
  'Name varchar(250),'+
  'POSTDATE DATE default date(),'+ {Дата и время появления записи в базе}
  'PRIMARY KEY (nrec)';

 TreeTable='DocsTree';
 TreeStruct=
  'nrec counter,'+
  'doctype varchar(4),'+
  'parent integer,'+
  'name varchar(250),'+
  'PRIMARY KEY (nrec)';

 ValutaTable='Valuta';
 ValutaStruct=
  'KOD VARCHAR(4),'+
  'NAME VARCHAR(8),'+
  'POSTDATE DATE default date(),'+ {Дата и время появления записи в базе}
  'PRIMARY KEY (KOD)';

 NDSStruct=
  'datn date default date(),'+
  'stavka money,'+
  'POSTDATE DATE default date(),'+ {Дата и время появления записи в базе}
  'PRIMARY KEY (datn)';

 PinTable='Pins';
 PinStruct=
  'PIN VARCHAR(8),'+
  'cKlient INTEGER,'+
  'Klient varchar(250),'+
  'POSTDATE DATE default date(),'+ {Дата и время появления записи в базе}
  'PRIMARY KEY (PIN)';
  
  ThumbW = 100;
  ThumbH = 70;

Var
 LastUserLogin,LastUserPassword:string;

 MainDir,DBDir,RepDir,ExRepDir,ProgName,TempDir,BackupDir,StatReportDir,OwnerReportDir,ErrorReportDir,
 MainVers,MainVersF,slinf,LastFirm,MainSortBy,LastBarkod:string;

 OraConString:string;

 LoggedIn:boolean;
 DebugMode:boolean;

 SchetBase,PlatBase,OperBase,SprBase,SysBase:string;
 AutoBackUp:boolean;
 QuickMassPrint:boolean;
 DefaultSrok:integer;
 DefaultMinSumma:currency;
 OplFirstSchet:integer;

 MHistMTE:TMemTableEh;
 UserGroup: int64;
 Host: IPluginHost;


// frxMainReport: TfrxReport;

implementation
end.
