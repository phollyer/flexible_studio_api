package api.win.lockAspectRatio
{
	import api.events.win.lockAspectRatio.LockAspectRatioEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockAspectRatio.html Northcode Help Documentation
	*/
	public class LockAspectRatio extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.LockAspectRatio()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockAspectRatio.html Northcode Help Documentation
		*/
		public function LockAspectRatio(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockAspectRatio.html Northcode Help Documentation
		*/
		public function lockAspectRatio():void
		{
			ssCore.Win.lockAspectRatio( {flag:flag}
								   	   ,{callback:actionComplete, errorSTR:"lockAspectRatioError", code:"6008"} );
		}
	}
}