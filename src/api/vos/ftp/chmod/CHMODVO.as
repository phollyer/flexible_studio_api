package swfStudio.vos.ftp.chmod
{
	import swfStudio.vos.ftp.chmod.members.GroupVO;
	import swfStudio.vos.ftp.chmod.members.OtherVO;
	import swfStudio.vos.ftp.chmod.members.UserVO;
	
	[Bindable]
	public class CHMODVO extends Object
	{
		public var group:GroupVO = new GroupVO();
		public var other:OtherVO = new OtherVO();
		public var user:UserVO = new UserVO();
		
		public function CHMODVO()
		{
			super();
		}	
	}
}