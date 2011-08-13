{:
  @abstract(Unit de registro de componentes do PascalSCADA. Para Delphi e Lazarus.)
  @author(Fabio Luis Girardi <papelhigienico@gmail.com>)
}
unit scadareg;

interface

procedure Register;

implementation

uses
  Classes, SerialPort, ModBusSerial, LinearScaleProcessor, PLCTagNumber,
  PLCBlock, PLCBlockElement, PLCString, UserScale, ValueProcessor,
  scadapropeditor, HMIEdit, HMILabel, HMICheckBox, HMIRadioButton, HMITrackBar,
  HMIProgressBar, HMIRadioGroup, HMIUpDown, HMIScrollBar, HMIAnimation,
  HMIText, HMIZones, hmipropeditor, hsstrings, TagBit, ProtocolDriver,
  WestASCIIDriver, IBoxDriver, tcp_udpport, ModBusTCP, PLCStruct, PLCNumber,
  PLCStructElement, ISOTCPDriver, HMIControlDislocatorAnimation,
  {$IFDEF FPC}
    LResources, PropEdits, ComponentEditors;
  {$ELSE}
    Types,
    //se for delphi 4 ou 5
    {$IF defined(VER130) or defined(VER120)}
      DsgnIntf;
    {$ELSE}
      //demais versoes do delphi
      DesignIntf, DesignEditors;
    {$IFEND}
  {$ENDIF}
procedure Register;
begin
  RegisterComponents(strPortsPallete,     [TSerialPortDriver]);
  RegisterComponents(strPortsPallete,     [TTCP_UDPPort]);
  RegisterComponents(strProtocolsPallete, [TModBusRTUDriver]);
  RegisterComponents(strProtocolsPallete, [TModBusTCPDriver]);
  RegisterComponents(strProtocolsPallete, [TWestASCIIDriver]);
  RegisterComponents(strProtocolsPallete, [TIBoxDriver]);
  RegisterComponents(strProtocolsPallete, [TISOTCPDriver]);
  RegisterComponents(strUtilsPallete,     [TPIPE]);
  RegisterComponents(strUtilsPallete,     [TLinearScaleProcessor]);
  RegisterComponents(strUtilsPallete,     [TUserScale]);
  RegisterComponents(strTagsPallete,      [TPLCTagNumber]);
  RegisterComponents(strTagsPallete,      [TPLCBlock]);
  RegisterComponents(strTagsPallete,      [TPLCBlockElement]);
  RegisterComponents(strTagsPallete,      [TPLCString]);
  RegisterComponents(strTagsPallete,      [TTagBit]);
  RegisterComponents(strTagsPallete,      [TPLCStruct]);
  RegisterComponents(strTagsPallete,      [TPLCStructItem]);

  RegisterComponents(strControlsPallete,  [THMIEdit]);
  RegisterComponents(strControlsPallete,  [THMILabel]);
  RegisterComponents(strControlsPallete,  [THMICheckBox]);
  RegisterComponents(strControlsPallete,  [THMIRadioButton]);
  RegisterComponents(strControlsPallete,  [THMITrackBar]);
  RegisterComponents(strControlsPallete,  [THMIProgressBar]);
  RegisterComponents(strControlsPallete,  [THMIRadioGroup]);
  RegisterComponents(strControlsPallete,  [THMIUpDown]);
  RegisterComponents(strControlsPallete,  [THMIScrollBar]);
  RegisterComponents(strControlsPallete,  [THMIAnimation]);
  RegisterComponents(strControlsPallete,  [THMIText]);
  RegisterComponents(strControlsPallete,  [THMIControlDislocatorAnimation]);
  //RegisterComponents(strControlsPallete,  [THMIButton]);

  RegisterPropertyEditor(TypeInfo(string), TSerialPortDriver,              'COMPort'  ,        TPortPropertyEditor);
  RegisterPropertyEditor(TypeInfo(integer),TPLCBlockElement,               'Index'    ,        TElementIndexPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TGraphicZone,                   'FileName' ,        TZoneFileNamePropertyEditor);
  RegisterPropertyEditor(TypeInfo(integer),TZone,                          'BlinkWith',        TZoneBlinkWithPropertyEditor);

  RegisterPropertyEditor(TypeInfo(string), THMIControlDislocatorAnimation, 'Gets_P0_Position', TPositionPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), THMIControlDislocatorAnimation, 'Gets_P1_Position', TPositionPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), THMIControlDislocatorAnimation, 'GoTo_P0_Position', TPositionPropertyEditor);

  RegisterComponentEditor(TProtocolDriver, TTagBuilderComponentEditor);
  RegisterComponentEditor(TPLCNumber,      TTagBitMapperComponentEditor);
  RegisterComponentEditor(TPLCBlock,       TBlockElementMapperComponentEditor);
end;

{$IFDEF FPC}
initialization
  {$I pascalscada.lrs}
{$ENDIF}
end.

