package api.events.ado.execSQL
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class ExecSQLEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_SQL:String = "missingSQL";
		public static const RESULT:String = "result";
		
		public var adoError:String = null;
		
		public function ExecSQLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExecSQLEvent = new ExecSQLEvent( type );
			e.adoError = adoError;
			return e;
		}
	}
}