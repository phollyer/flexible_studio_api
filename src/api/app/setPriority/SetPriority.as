package api.app.setPriority
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	import api.events.app.setPriority.SetPriorityEvent

	[Bindable]
	public class SetPriority extends App
	{
		public static const HIGH:String = "high";
		public static const IDLE:String = "idle";
		public static const NORMAL:String = "normal";
		public static const REAL_TIME:String = "realtime";
		
		// Required
		public var priority:String = NORMAL;
		
		public function SetPriority(target:IEventDispatcher=null)
		{
			super(target);
		}
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