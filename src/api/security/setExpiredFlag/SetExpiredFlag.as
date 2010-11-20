package api.security.setExpiredFlag
{
	import flash.events.IEventDispatcher;
	
	import api.errors.Security_Error;
	import api.security.Security;

	[Bindable]
	public class SetExpiredFlag extends Security
	{
		// Optional
		public var expired:Boolean = false;
		
		public function SetExpiredFlag(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setExpiredFlag():void
		{
			ssCore.Security.setExpiredFlag( {flag:expired}
										   ,{callback:actionComplete, errorSTR:"setExpiredFlagError", code:"36004"} );
		}
	}
}