package api.win.lockMaxSize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class LockMaxSize extends Win
	{
		// Optional
		public var flag:Boolean = true;
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function LockMaxSize(target:IEventDispatcher=null)
		{
			super(target);
		}
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