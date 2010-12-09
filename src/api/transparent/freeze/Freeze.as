package api.transparent.freeze
{
	import api.events.transparent.freeze.FreezeEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Allows you to freeze the window shape at runtime to reduce the CPU load for transparent applications.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_freeze.html Northcode Help Documentation
	*/
	public class Freeze extends Transparent
	{
		// Required
		/**
		* A boolean value that controls whether the window shape is frozen or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Transparent.Freeze()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_freeze.html Northcode Help Documentation
		*/
		public function Freeze(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Allows you to freeze the window shape at runtime to reduce the CPU load for transparent applications.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_freeze.html Northcode Help Documentation
		*/
		public function freeze():void
		{
			ssCore.Transparent.freeze( {flag:flag}
									  ,{callback:actionComplete, errorSTR:"freezeError", code:"42002"} );
		}
	}
}