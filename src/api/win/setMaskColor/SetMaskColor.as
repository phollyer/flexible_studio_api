package api.win.setMaskColor
{
	import api.events.win.setMaskColor.SetMaskColorEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>color</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_COLOR
	*/
	[Event(name="missingColor" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Make all pixels of a given color transparent.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setMaskColor.html Northcode Help Documentation
	*/
	public class SetMaskColor extends Win
	{		
		// Required
		/**
		* Hex representation of the color to use as the mask color in rrggbb or #rrggbb format. Use an empty string to disable color masking.
		*
		* @defaultValue <code>null</code>
		*/
		public var color:String = null;
		
		/**
		* Constructor for Win.SetMaskColor()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setMaskColor.html Northcode Help Documentation
		*/
		public function SetMaskColor(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Make all pixels of a given color transparent.
		*
		*
		* @param maskColor
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setMaskColor.html Northcode Help Documentation
		*/
		public function setMaskColor( maskColor:String = null ):void
		{			
			color = compareStrings( maskColor , color );
			
			switch( color )
			{
				case null:
					missingColor();
					break;
				default:
					ssCore.Win.setMaskColor( {color:color}
											,{callback:actionComplete, errorSTR:"setMaskColorError", code:"6025"} );	
			}
		}
	}
}