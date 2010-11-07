package api.splash.setPosition
{
	import flash.events.IEventDispatcher;
	import api.splash.Splash;

	[Event(name="missingData", 										type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetPosition extends Splash
	{
		public var x					:Number						= 0;
		public var y					:Number						= 0;
		
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setPosition( xPos:Number = -1, yPos:Number = -1 ):void
		{
			switch( xPos != -1 )
			{
				case true:
					x 												= xPos;
			}
			switch( yPos != -1 )
			{
				case true:
					y												= yPos;
			}
			
			ssCore.Splash.setPosition( {x:x, y:y}, {callback:setPositionComplete} );
		}
		
		private function setPositionComplete( r:Object , c:Object , e:Object ):void
		{
			switch( r.success )
			{
				case true:
					var event			:SetPositionEvent			= new SetPositionEvent(SetPositionEvent.RESULT);
					dispatchEvent(event);					
					break;
				case false:
					e.id											= "5006";
					dispatchError(SplashError.SET_POSITION_ERROR, e);
			}
		}
	}
}