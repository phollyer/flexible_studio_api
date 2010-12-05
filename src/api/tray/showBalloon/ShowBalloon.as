package api.tray.showBalloon
{
	import api.events.tray.showBalloon.ShowBalloonEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Display a balloon tip above the system tray icon with custom text, title and icon.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_showBalloon.html Northcode Help Documentation
	*/
	public class ShowBalloon extends Tray
	{
		public static const ERROR_ICON:String = "error";
		public static const INFO_ICON:String = "info";
		public static const WARNING_ICON:String = "warning";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var title:String = null;
		/**
		* 
		*
		* @defaultValue <code>10000</code>
		*/
		public var timeout:Number = 10000;
		/**
		* 
		*
		* @defaultValue <code>INFO_ICON</code>
		*/
		public var icon:String = INFO_ICON;
		
		// Required
		/**
		* Text to be displayed in the balloon tip.
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Tray.ShowBalloon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_showBalloon.html Northcode Help Documentation
		*/
		public function ShowBalloon(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Display a balloon tip above the system tray icon with custom text, title and icon.
		*
		*
		* @param balloonText
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_showBalloon.html Northcode Help Documentation
		*/
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