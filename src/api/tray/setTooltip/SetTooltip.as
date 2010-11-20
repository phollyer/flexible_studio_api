package api.tray.setTooltip
{
	import flash.events.IEventDispatcher;
	import api.tray.Tray;
	
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetTooltip extends Tray
	{
		// Required
		public var text:String = null;
		
		public function SetTooltip(target:IEventDispatcher=null)
		{
			super(target);
		}
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