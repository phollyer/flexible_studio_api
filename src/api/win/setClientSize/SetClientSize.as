package api.win.setClientSize
{
	import api.events.win.setClientSize.SetClientSizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>height</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_HEIGHT
	*/
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setClientSize.html Northcode Help Documentation
	*/
	public class SetClientSize extends Win
	{		
		// Required
		public var height:Number = -1;
		public var width:Number = -1;
		
		/**
		* Constructor for Win.SetClientSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setClientSize.html Northcode Help Documentation
		*/
		public function SetClientSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param clientHeight
		*
		* @param clientWidth
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setClientSize.html Northcode Help Documentation
		*/
		public function setClientSize( clientHeight:Number = -1 , clientWidth:Number = -1 ):void
		{			
			height = compareNumbers( clientHeight , height );
			width = compareNumbers( clientWidth , clientHeight );
			
			switch( height > -1 )
			{
				case false:
					missingHeight();
					break;
				default:
					switch( width > -1 )
					{
						case false:
							missingWidth();
							break;
						default:
							ssCore.Win.setClientSize( {width:width , height:height}
											   		 ,{callback:actionComplete, errorSTR:"setClientSizeError", code:"6021"} );	
					}
			}
		}

	}
}