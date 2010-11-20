package api.splash.setPosition
{
	import api.events.splash.setPosition.SetPositionEvent;

	import api.splash.Splash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData", 										type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_setPosition.html Northcode Help Documentation
	*/
	public class SetPosition extends Splash
	{
		public var x					:Number						= 0;
		public var y					:Number						= 0;
		
		/**
		* Constructor for Splash.SetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_setPosition.html Northcode Help Documentation
		*/
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param xPos
		*
		* @param yPos
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_setPosition.html Northcode Help Documentation
		*/
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