package api.win.setBackColor
{
	import api.events.win.setBackColor.SetBackColorEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setBackColor.html Northcode Help Documentation
	*/
	public class SetBackColor extends Win
	{		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var color:String = null;
		
		/**
		* Constructor for Win.SetBackColor()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setBackColor.html Northcode Help Documentation
		*/
		public function SetBackColor(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param maskColor
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setBackColor.html Northcode Help Documentation
		*/
		public function setBackColor( maskColor:String = null ):void
		{			
			color = compareStrings( maskColor , color );
			
			switch( color )
			{
				case null:
					missingColor();
					break;
				default:
					ssCore.Win.setBackColor( {color:color}
											,{callback:actionComplete, errorSTR:"setBackColorError", code:"6018"} );	
			}
		}
	}
}