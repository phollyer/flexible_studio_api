package api.mouse.lock
{
	import api.events.mouse.lock.LockEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Restrict mouse movement to your application window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_lock.html Northcode Help Documentation
	*/
	public class Lock extends Mouse
	{		
		/**
		* Constructor for Mouse.Lock()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_lock.html Northcode Help Documentation
		*/
		public function Lock(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Restrict mouse movement to your application window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_lock.html Northcode Help Documentation
		*/
		public function lock():void
		{
			ssCore.Mouse.lock( {}
							  ,{callback:actionComplete, errorSTR:"lockError", code:"29002"} );
		}
	}
}