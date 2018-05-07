package cn.wmyskxz.service;

import cn.wmyskxz.mapper.ReferalLinkMapper;
import cn.wmyskxz.pojo.ReferalLink;
import cn.wmyskxz.pojo.ReferalLinkExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ReferalLinkService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-上午 10:48
 */
@Service
public class ReferalLinkServiceImpl implements ReferalLinkService {

	@Autowired
	ReferalLinkMapper referalLinkMapper;

	public List<ReferalLink> listAll() {
		ReferalLinkExample example = new ReferalLinkExample();
		return referalLinkMapper.selectByExample(example);
	}

	public void updateLinkText(Integer id, String text) {
		ReferalLink referalLink = get(id);
		referalLink.setText(text);
		referalLinkMapper.updateByPrimaryKey(referalLink);
	}

	public void update(ReferalLink link) {
		referalLinkMapper.updateByPrimaryKey(link);
	}

	public void updateLinkLink(Integer id, String link) {
		ReferalLink referalLink = get(id);
		referalLink.setLink(link);
		referalLinkMapper.updateByPrimaryKey(referalLink);
	}

	public ReferalLink get(Integer id) {
		return referalLinkMapper.selectByPrimaryKey(id);
	}
}
