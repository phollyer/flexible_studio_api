package api.win.setSize
{
	import api.events.win.setSize.SetSizeEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSize.html Northcode Help Documentation
	*/
	public class SetSize extends Win
	{		
		// Required
		public var height:Number = -1;
		public var width:Number = -1;
		
		/**
		* Constructor for Win.SetSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSize.html Northcode Help Documentation
		*/
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param winHeight
		*
		* @param winWidth
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setSize.html Northcode Help Documentation
		*/
		public function setSize( winHeight:Number = -1 , winWidth:Number = -1 ):void
		{			
			height = compareNumbers( winHeight , height );
			width = compareNumbers( winWidth , width );
			
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
							ssCore.Win.setSize( {width:width , height:height}
											   ,{callback:actionComplete, errorSTR:"setSizeError", code:"6027"} );	
					}
			}
		}

	}
}