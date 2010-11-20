package api.mouse.unlock
{
	import api.events.mouse.unlock.UnlockEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_unlock.html Northcode Help Documentation
	*/
	public class Unlock extends Mouse
	{		
		/**
		* Constructor for Mouse.Unlock()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_unlock.html Northcode Help Documentation
		*/
		public function Unlock(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_unlock.html Northcode Help Documentation
		*/
		public function unlock():void
		{
			ssCore.Mouse.unlock( {}
							    ,{callback:actionComplete, errorSTR:"unlockError", code:"29009"} );
		}
	}
}