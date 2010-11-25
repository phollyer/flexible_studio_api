package api.app.setPriority
{
	import api.app.App;

	import api.events.app.setPriority.SetPriorityEvent;

	import flash.events.IEventDispatcher;
	import api.events.app.setPriority.SetPriorityEvent

	/**
	 * Dispatched if the Property <code>priority</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_PRIORITY
	 */
	[Event(name="missingPriority", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setPriority.html Northcode Help Documentation
	 */
	public class SetPriority extends App
	{
		public static const HIGH:String = "high";
		public static const IDLE:String = "idle";
		public static const NORMAL:String = "normal";
		public static const REAL_TIME:String = "realtime";
		
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>NORMAL</code>
		 */
		public var priority:String = NORMAL;
		
		/**
		 * Constructor for App.SetPriority()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setPriority.html Northcode Help Documentation
		 */
		public function SetPriority(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param appPriority
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setPriority.html Northcode Help Documentation
		 */
		public function setPriority( appPriority:String ):void
		{
			priority = compareStrings( appPriority , priority );
			switch( priority )
			{
				case null:
					missingPriority();
					break;
				default:
					ssCore.App.setPriority( {priority:priority} , {callback:actionComplete, errorSTR:"setPriorityError", code:"8017"} );
			}
		}
	}
}