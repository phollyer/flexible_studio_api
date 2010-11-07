package api.tray.showBalloon
{
	import flash.events.IEventDispatcher;
	import api.tray.Tray;
	
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ShowBalloon extends Tray
	{
		public static const ERROR_ICON:String = "error";
		public static const INFO_ICON:String = "info";
		public static const WARNING_ICON:String = "warning";
		
		// Optional
		public var title:String = null;
		public var timeout:Number = 10000;
		public var icon:String = INFO_ICON;
		
		// Required
		public var text:String = null;
		
		public function ShowBalloon(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showBalloon( balloonText:String = null ):void
		{
			text = compareStrings( balloonText , text );
			
			switch( text )
			{
				case null:
					missingText();
					break;
				default:
					var __o:Object = new Object();
					__o.text = text;
					__o.timeout = timeout;
					__o.icon = icon;
					switch( title != null )
					{
						case true:
							__o.title = title;
					}
					ssCore.Tray.showBalloon( __o
										   ,{callback:actionComplete, errorSTR:"showBalloonError", code:"43005"} );
			}
		}
	}
}