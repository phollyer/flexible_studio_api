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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setMaskColor.html Northcode Help Documentation
	*/
	public class SetMaskColor extends Win
	{		
		// Required
		/**
		* 
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
		*
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