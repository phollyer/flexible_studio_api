package api.vos.shell
{
	public class ExecuteVO extends Object
	{
		public static const HIDDEN:String = "hidden";
		public static const MAXIMIZED:String = "maximized";
		public static const MINIMIZED:String = "minimized";
		public static const NORMAL:String = "normal";
		
		// Optional
		public var args:String = "";
		public var currentDir:String = "";
		public var forceChild:Boolean = false;
		public var height:Number = -1;
		public var is16Bit:Boolean = false;
		public var saveStdOut:Boolean = false;
		public var timeOut:Number = 0;
		public var topmost:Boolean = false;
		public var waitForWindow:Boolean = false;
		public var waitForExit:Boolean = false;
		public var width:Number = -1;
		public var winState:String = NORMAL;
		public var x:Number = -1;
		public var y:Number = -1;
		
		// Required
		public var path:String = null;
		
		public function ExecuteVO()
		{
		}
		public function createObject():Object
		{
			var __o:Object = new Object();
			__o.forceChild = forceChild;
			__o.is16Bit = is16Bit;
			__o.path = path;
			__o.saveStdOut = saveStdOut;
			__o.timeOut = timeOut;
			__o.topmost = topmost;
			__o.waitForExit = waitForExit;
			__o.waitForWindow = waitForWindow;
			__o.winState = winState;
			
			switch( args != "" )
			{
				case true:
					__o.arguments = args;
			}
			switch( currentDir != "" )
			{
				case true:
					__o.currentDir = currentDir;
			}
			switch( height > 0 )
			{
				case true:
					__o.height = height;
			}
			switch( width > 0 )
			{
				case true:
					__o.width = width;
			}
			switch( x > -1 )
			{
				case true:
					__o.x = x;
			}
			switch( y > -1 )
			{
				case true:
					__o.y = y;
			}
			
			return __o;
		}
	}
}