package api.wmVideo.setGuides
{
	import flash.events.IEventDispatcher;
	import api.vos.wmVideo.SetGuidesVO;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetGuides extends WmVideo
	{
		// Optional 
		public var guides:SetGuidesVO = new SetGuidesVO();
		
		public function SetGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setGuides():void
		{
			ssCore.WmVideo.setGuides( guides
									,{callback:actionComplete, errorSTR:"setGuidesError", code:"46007"} );
		}
	}
}