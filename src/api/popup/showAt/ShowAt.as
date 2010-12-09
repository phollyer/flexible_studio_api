package api.popup.showAt
{
	import api.events.popup.showAt.ShowAtEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.popup.showAt.ShowAtEvent.RESULT
	*/
	[Event(name="result", type="api.events.popup.showAt.ShowAtEvent")]
	[Bindable]
	/**
	* Display the named popup menu at the specified x,y location.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_showAt.html Northcode Help Documentation
	*/
	public class ShowAt extends Popup
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		// Required
		/**
		* The name of the menu to display.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var itemID:String = null;
		
		/**
		* Constructor for Popup.ShowAt()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_showAt.html Northcode Help Documentation
		*/
		public function ShowAt(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Display the named popup menu at the specified x,y location.
		*
		*
		* @param menuName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_showAt.html Northcode Help Documentation
		*/
		public function showAt( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.showAt( {name:name , x:x , y:y}
									    ,{callback:actionComplete, errorSTR:"showAtError", code:"31011"} );
			}
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			itemID = r.result;
			
			var e : ShowAtEvent = new ShowAtEvent( ShowAtEvent.RESULT );
			e.itemID = itemID;
			dispatchEvent( e );
		}
	}
}