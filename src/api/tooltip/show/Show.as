package api.tooltip.show
{
	import flash.events.IEventDispatcher;
	import api.tooltip.Tooltip;
	import api.vos.tooltip.ShowVO;

	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Show extends Tooltip
	{
		// Required 
		public var settings:ShowVO = new ShowVO();
		
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show( text:String = null ):void
		{
			settings.text = compareStrings( text , settings.text );
			
			switch( settings.text )
			{
				case null:
					missingText();
					break;
				default:
					ssCore.Tooltip.show( settings.createObject()
									   ,{callback:actionComplete, errorSTR:"showError", code:"41001"} );
			}
		}
	}
}