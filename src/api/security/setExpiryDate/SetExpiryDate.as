package api.security.setExpiryDate
{
	import flash.events.IEventDispatcher;
	
	import api.errors.Security_Error;
	import api.security.Security;

	[Bindable]
	public class SetExpiryDate extends Security
	{
		// Optional
		public var day:int = 1;
		public var hour:int = 0;
		public var minute:int = 0;
		public var month:int = 1;
		public var second:int = 0;
		public var year:int = 2010;
		
		public function SetExpiryDate(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setExpiryDate():void
		{
			ssCore.Security.setExpiryDate( {year:year , month:month , day:day , hour:hour , minute:minute , second:second}
										  ,{callback:actionComplete, errorSTR:"setExpiryDateError", code:"36005"} );
		}
	}
}