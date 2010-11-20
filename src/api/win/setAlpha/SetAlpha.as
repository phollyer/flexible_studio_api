package api.win.setAlpha
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingPercent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetAlpha extends Win
	{		
		// Optional
		public var alpha:Number = -1;
		
		// Required
		public var percent:Number = -1;
		
		public function SetAlpha(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setAlpha( percentNUM:Number = -1 ):void
		{			
			percent = compareNumbers( percentNUM , percent );
			
			var __o:Object = new Object();
			
			switch( percent > -1 )
			{
				case false:
					switch( alpha > -1 )
					{
						case false:
							missingPercent();
							break;
						default:
							ssCore.Win.setAlpha( {alpha:alpha}
											    ,{callback:actionComplete, errorSTR:"setAlphaError", code:"6017"} );							
					}
					break;
				default:
					switch( alpha > -1 )
					{
						case true:
							__o.alpha = alpha;
							break;
					}
					__o.percent = percent;
					ssCore.Win.setAlpha( __o
									   ,{callback:actionComplete, errorSTR:"setAlphaError", code:"6017"} );	
			}
		}
		private function setAlphaComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetAlphaEvent = new SetAlphaEvent( SetAlphaEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6017";
					dispatchError( WinError.SET_ALPHA_ERROR , e );
			}
		}
	}
}