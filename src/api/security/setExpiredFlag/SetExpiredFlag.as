package api.security.setExpiredFlag
{
	import api.events.security.setExpiredFlag.SetExpiredFlagEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Set the expired flag for this application. This overrides the conditions on the Expiry tab and forces the application to the expired state immediately. Clearing the expiry flag reverse this operation but if the application is already expired then clearing the expired flag will appear to have no effect.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiredFlag.html Northcode Help Documentation
	*/
	public class SetExpiredFlag extends Security
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var expired:Boolean = false;
		
		/**
		* Constructor for Security.SetExpiredFlag()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiredFlag.html Northcode Help Documentation
		*/
		public function SetExpiredFlag(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the expired flag for this application. This overrides the conditions on the Expiry tab and forces the application to the expired state immediately. Clearing the expiry flag reverse this operation but if the application is already expired then clearing the expired flag will appear to have no effect.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiredFlag.html Northcode Help Documentation
		*/
		public function setExpiredFlag():void
		{
			ssCore.Security.setExpiredFlag( {flag:expired}
										   ,{callback:actionComplete, errorSTR:"setExpiredFlagError", code:"36004"} );
		}
	}
}