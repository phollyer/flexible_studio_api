package api.wmVideo.setResource
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetResource extends WmVideo
	{
		// Required
		public var resource:String = null;
		
		public function SetResource(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setResource( videoResource:String = null ):void
		{
			resource = compareStrings( videoResource , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.WmVideo.setResource( {resource:resource}
											   ,{callback:actionComplete, errorSTR:"setResourceError", code:"46013"} );
			}
		}
	}
}