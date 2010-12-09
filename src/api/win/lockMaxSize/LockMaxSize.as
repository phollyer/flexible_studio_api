package api.win.lockMaxSize
{
	import api.events.win.lockMaxSize.LockMaxSizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the maximum window size.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockMaxSize.html Northcode Help Documentation
	*/
	public class LockMaxSize extends Win
	{
		// Optional
		/**
		* A flag that controls whether the max size should be enabled or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		public var height:Number = -1;
		public var width:Number = -1;
		
		/**
		* Constructor for Win.LockMaxSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockMaxSize.html Northcode Help Documentation
		*/
		public function LockMaxSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the maximum window size.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockMaxSize.html Northcode Help Documentation
		*/
		public function lockMaxSize():void
		{
			var __o:Object = new Object();
			__o.flag = flag;
			switch( height > -1 )
			{
				case true:
					__o.height = height;
			}
			switch( width > -1 )
			{
				case true:
					__o.width = width;
			}
			ssCore.Win.lockMaxSize( __o
								  ,{callback:actionComplete, errorSTR:"lockMaxSizeError", code:"6009"} );
		}
	}
}