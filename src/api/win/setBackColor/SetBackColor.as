package api.win.setBackColor
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingColor" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetBackColor extends Win
	{		
		// Required
		public var color:String = null;
		
		public function SetBackColor(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setBackColor( maskColor:String = null ):void
		{			
			color = compareStrings( maskColor , color );
			
			switch( color )
			{
				case null:
					missingColor();
					break;
				default:
					ssCore.Win.setBackColor( {color:color}
											,{callback:actionComplete, errorSTR:"setBackColorError", code:"6018"} );	
			}
		}
		private function setBackColorComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetBackColorEvent = new SetBackColorEvent( SetBackColorEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6018";
					dispatchError( WinError.SET_BACK_COLOR_ERROR , e );
			}
		}
	}
}