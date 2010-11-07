package api.win.lockMinSize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class LockMinSize extends Win
	{
		// Optional
		public var flag:Boolean = true;
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function LockMinSize(target:IEventDispatcher=null)
		{
			super(target);
		}
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