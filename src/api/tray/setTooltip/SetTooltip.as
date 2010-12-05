package api.tray.setTooltip
{
	import api.events.tray.setTooltip.SetTooltipEvent;

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
	* Change the tooltip text that will appear when you mouse over the icon in the system tray.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_setTooltip.html Northcode Help Documentation
	*/
	public class SetTooltip extends Tray
	{
		// Required
		/**
		* The new tooltip text. If the text has newlines ('\n') in it, a multiline tooltip will be displayed.
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Tray.SetTooltip()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_setTooltip.html Northcode Help Documentation
		*/
		public function SetTooltip(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Change the tooltip text that will appear when you mouse over the icon in the system tray.
		*
		*
		* @param tooltipText
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_setTooltip.html Northcode Help Documentation
		*/
		public function setTooltip( tooltipText:String = null ):void
		{
			text = compareStrings( tooltipText , text );
			
			switch( text )
			{
				case null:
					missingText();
					break;
				default:
					ssCore.Tray.setTooltip( {text:text}
										   ,{callback:actionComplete, errorSTR:"setTooltipError", code:"43004"} );
			}
		}
	}
}