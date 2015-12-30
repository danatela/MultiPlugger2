unit UPlugin;

interface

uses ADODB, DB, Forms, RTTI, Classes;

type
  TPlugin = class abstract
  public
    class function Name: string; virtual; abstract;
    class function Group: string; virtual; abstract;
    class function Pos: Integer; virtual; abstract;
    class function UserGroups: string; virtual; abstract;
    class function AutoLoad: Boolean; virtual; abstract;
    class function Hidden: Boolean; virtual; abstract;
    class function GetPropNames: TStrings; virtual; abstract;
    procedure Exec; virtual; abstract;
    function SetProp(Key: string; Value: TValue): Boolean; virtual; abstract;
    function GetProp(Key: string): TValue; virtual; abstract;
    function Form: TForm; virtual; abstract;
  end;

  TPluginClass = class of TPlugin;
  IPluginHost = interface
    function RunPlugin(PluginName: string): TPlugin; // запуск плагина по имени класса
    function ADOC: TADOConnection;
    function PicturesDir: string;
    function GetPrivacyParams(Key: string): TValue;
  end;

implementation

end.
 