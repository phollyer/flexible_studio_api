package api.vos.desktop
{
	[Bindable]
	public class SaveImageVO extends Object
	{
		public static const BITMAP:String = "bitmap";
		public static const JPEG:String = "jpeg";
		
		// Optional
		public var format:String = JPEG;
		public var height:Number = -1;
		public var left:Number = 0;
		public var quality:Number = 90;
		public var top:Number = 0;
		public var width:Number = -1;
		
		// Required
		public var path:String = null;
		
		public function SaveImageVO()
		{
			super();
		}
		public function getObject():Object
		{
			var __o:Object = new Object();
			__o.format = format;
			__o.left = left;
			__o.quality = quality;
			__o.top = top;
			
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
			
			return __o;
		}
	}
}