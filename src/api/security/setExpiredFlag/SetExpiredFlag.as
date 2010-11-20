package api.security.setExpiredFlag
{
	import api.errors.Security_Error;

	import api.events.security.setExpiredFlag.SetExpiredFlagEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
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
		*
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