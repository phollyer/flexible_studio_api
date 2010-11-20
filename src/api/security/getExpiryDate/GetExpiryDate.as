package api.security.getExpiryDate
{
	import flash.events.IEventDispatcher;
	
	import api.errors.Security_Error;
	import api.events.security.getExpiryDate.GetExpiryDateEvent;
	import api.security.Security;

	[Event(name="result", type="api.events.security.getExpiryDate.GetExpiryDateEvent")]
	[Bindable]
	public class GetExpiryDate extends Security
	{
		// Result
		public var dateString:String = null;
		public var day:int = 0;
		public var hour:int = 0;
		public var minute:int = 0;
		public var month:int = 0;
		public var second:int = 0;
		public var year:int = 0;
		
		public function GetExpiryDate(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getExpiryDate():void
		{
			ssCore.Security.getExpiryDate( {}
										  ,{callback:actionComplete, errorSTR:"getExpiryDateError", code:"36001"} );
		}
		override protected function sendResult( r:Object ):void
		{
			dateString = r.result;
			day = Number( r.day );
			hour = Number( r.hour );
			minute = Number( r.minute );
			month = Number( r.month );
			second = Number( r.second );
			year = Number( r.year );
			
			var e : GetExpiryDateEvent = new GetExpiryDateEvent( GetExpiryDateEvent.RESULT );
			e.dateString = dateString;
			e.day = day;
			e.hour = hour;
			e.minute = minute;
			e.month = month;
			e.second = second;
			e.year = year;			
			dispatchEvent( e );
		}
	}
}