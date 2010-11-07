package api.flash.getBackColor
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.flash.getBackColor.GetBackColorEvent;
	import api.flash.Flash;

	[Event(name="result", type="api.events.flash.getBackColor.GetBackColorEvent")]
	[Bindable]
	public class GetBackColor extends Flash
	{
		// Optional
		public var path:String = null;
		
		// Result
		public var color:String = null;		
		
		public function GetBackColor(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getBackColor():void
		{
			switch( path )
			{
				case null:
					ssCore.Flash.getBackColor( {}
											  ,{callback:actionComplete, errorSTR:"getBackColorError", code:"21001"} );
					break;
				default:
					ssCore.Flash.getBackColor( {path:path}
											  ,{callback:actionComplete, errorSTR:"getBackColorError", code:"21001"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			color = r.result;
			
			var e : GetBackColorEvent = new GetBackColorEvent( GetBackColorEvent.RESULT );
			e.color = color;
			dispatchEvent( e );
		}
	}
}