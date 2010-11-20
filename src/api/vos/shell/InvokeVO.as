package swfStudio.vos.shell
{
	public class InvokeVO extends Object
	{
		public var forceChild:Boolean = false;
		public var height:Number = -1;
		public var openAs:String = null;
		public var path:String = null;
		public var timeOut:int = 0;
		public var topmost:Boolean = true;
		public var useFileExts:Boolean = false;
		public var verb:String = null;
		public var waitForExit:Boolean = false;
		public var waitForWindow:Boolean = false;
		public var width:Number = -1;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function InvokeVO()
		{
			super();
		}
		public function createObject():Object
		{
			var __o:Object = new Object();
			__o.forceChild = forceChild;
			__o.timeOut = timeOut;
			__o.topmost = topmost;
			__o.useFileExts = useFileExts;
			__o.waitForExit = waitForExit;
			__o.waitForWindow = waitForWindow;
			__o.x = x;
			__o.y = y;
			
			switch( height > 0 )
			{
				case true:
					__o.height = height;
			}
			switch( openAs != null )
			{
				case true:
					__o.openAs = openAs;
			}
			switch( path != null )
			{
				case true:
					__o.path = path;
			}
			switch( verb != null )
			{
				case true:
					__o.verb = verb;
			}
			switch( width > 0 )
			{
				case true:
					__o.width = width;
			}
			
			return __o;
		}
	}
}