package api.desktop.changeResolution
{
	import flash.events.IEventDispatcher;
	
	import api.desktop.Desktop;
	import api.vos.desktop.ChangeResolutionVO;

	[Bindable]
	public class ChangeResolution extends Desktop
	{
		// Optional
		public var resolutionSettings:ChangeResolutionVO = new ChangeResolutionVO();
		
		public function ChangeResolution(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function changeResolution():void
		{
			ssCore.Desktop.changeResolution( resolutionSettings
											,{callback:actionComplete, errorSTR:"changeResolutionError", code:"19002"} );
		}
		public function changeResolutionComplete( r:Object , c:Object , e:Object ):void
		{
			switch( r.success )
			{
				case true:
					var event : ChangeResolutionEvent = new ChangeResolutionEvent( ChangeResolutionEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "19002";
					dispatchError( DesktopError.CHANGE_RESOLUTION_ERROR , e );
			}
		}
	}
}