package swfStudio.vos.console
{
	[Bindable]
	public class OpenVO extends Object
	{
		public var height:Number = -1;
		public var title:String = null;
		public var topmost:Boolean = true;
		public var width:Number = -1;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function OpenVO()
		{
			super();
		}
		public function createObject():Object
		{
			var __o : Object = new Object();
			switch( height > 0 )
			{
				case true:
					__o.height = height;
			}
			switch( title != null )
			{
				case true:
					__o.title = title;
			}
			switch( width > 0 )
			{
				case true:
					__o.width = width;
			}
			__o.topmost = topmost;
			__o.x = x;
			__o.y = y;
			
			return __o;
		}
	}
}