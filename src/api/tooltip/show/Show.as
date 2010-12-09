package api.tooltip.show
{
	import api.events.tooltip.show.ShowEvent;

	import api.tooltip.Tooltip;

	import api.vos.tooltip.ShowVO;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Displays a tooltip.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip_show.html Northcode Help Documentation
	*/
	public class Show extends Tooltip
	{
		// Required 
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:ShowVO = new ShowVO();
		
		/**
		* Constructor for Tooltip.Show()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip_show.html Northcode Help Documentation
		*/
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Displays a tooltip.
		*
		*
		* @param text
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip_show.html Northcode Help Documentation
		*/
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