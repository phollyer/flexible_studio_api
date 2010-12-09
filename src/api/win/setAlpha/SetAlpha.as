package api.win.setAlpha
{
	import api.events.win.setAlpha.SetAlphaEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>percent</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PERCENT
	*/
	[Event(name="missingPercent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Change the alpha value of the player window to make it more or less transparent.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setAlpha.html Northcode Help Documentation
	*/
	public class SetAlpha extends Win
	{		
		// Optional
		public var alpha:Number = -1;
		
		// Required
		public var percent:Number = -1;
		
		/**
		* Constructor for Win.SetAlpha()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setAlpha.html Northcode Help Documentation
		*/
		public function SetAlpha(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Change the alpha value of the player window to make it more or less transparent.
		*
		*
		* @param percentNUM
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setAlpha.html Northcode Help Documentation
		*/
		public function setAlpha( percentNUM:Number = -1 ):void
		{			
			percent = compareNumbers( percentNUM , percent );
			
			var __o:Object = new Object();
			
			switch( percent > -1 )
			{
				case false:
					switch( alpha > -1 )
					{
						case false:
							missingPercent();
							break;
						default:
							ssCore.Win.setAlpha( {alpha:alpha}
											    ,{callback:actionComplete, errorSTR:"setAlphaError", code:"6017"} );							
					}
					break;
				default:
					switch( alpha > -1 )
					{
						case true:
							__o.alpha = alpha;
							break;
					}
					__o.percent = percent;
					ssCore.Win.setAlpha( __o
									   ,{callback:actionComplete, errorSTR:"setAlphaError", code:"6017"} );	
			}
		}
	}
}