package api.win.lockMinSize
{
	import api.events.win.lockMinSize.LockMinSizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the minimum window size.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockMinSize.html Northcode Help Documentation
	*/
	public class LockMinSize extends Win
	{
		// Optional
		/**
		* A boolean value that indicates whether the minimum size should be locked or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		public var height:Number = -1;
		public var width:Number = -1;
		
		/**
		* Constructor for Win.LockMinSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockMinSize.html Northcode Help Documentation
		*/
		public function LockMinSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the minimum window size.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockMinSize.html Northcode Help Documentation
		*/
		public function lockMinSize():void
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
			ssCore.Win.lockMinSize( __o
								  ,{callback:actionComplete, errorSTR:"lockMinSizeError", code:"6010"} );
		}
	}
}