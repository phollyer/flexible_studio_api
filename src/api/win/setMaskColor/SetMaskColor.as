package api.win.setMaskColor
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingColor" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetMaskColor extends Win
	{		
		// Required
		public var color:String = null;
		
		public function SetMaskColor(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setMaskColor( maskColor:String = null ):void
		{			
			color = compareStrings( maskColor , color );
			
			switch( color )
			{
				case null:
					missingColor();
					break;
				default:
					ssCore.Win.setMaskColor( {color:color}
											,{callback:actionComplete, errorSTR:"setMaskColorError", code:"6025"} );	
			}
		}
		private function setMaskColorComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetMaskColorEvent = new SetMaskColorEvent( SetMaskColorEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6025";
					dispatchError( WinError.SET_MASK_COLOR_ERROR , e );
			}
		}
	}
}